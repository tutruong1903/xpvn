<script src="//cdnjs.cloudflare.com/ajax/libs/tinymce/7.2.0/tinymce.min.js"></script>

<script>
    /**
     * Compress an image blob to a JPEG data URI.
     * - Resizes to fit within maxPx × maxPx while keeping aspect ratio.
     * - Encodes as JPEG at the given quality (0–1).
     */
    function compressImageBlob(blobInfo, maxPx, quality) {
        return new Promise(function (resolve) {
            var img = new Image();
            img.onload = function () {
                var w = img.width;
                var h = img.height;

                // Scale down if either dimension exceeds maxPx
                if (w > maxPx || h > maxPx) {
                    if (w >= h) {
                        h = Math.round(h * maxPx / w);
                        w = maxPx;
                    } else {
                        w = Math.round(w * maxPx / h);
                        h = maxPx;
                    }
                }

                var canvas = document.createElement('canvas');
                canvas.width  = w;
                canvas.height = h;
                canvas.getContext('2d').drawImage(img, 0, 0, w, h);

                resolve(canvas.toDataURL('image/jpeg', quality));
            };
            img.src = 'data:' + blobInfo.blob().type + ';base64,' + blobInfo.base64();
        });
    }

    document.addEventListener("DOMContentLoaded", function () {
        tinyMCE.baseURL = '//cdnjs.cloudflare.com/ajax/libs/tinymce/7.2.0';
        tinyMCE.suffix = '.min';
        tinyMCE.init({
            selector: '#tinymce',
            menubar: false,
            statusbar: false,
            plugins:
                'advlist autolink lists link image charmap preview anchor searchreplace visualblocks ' +
                'code insertdatetime media table',
            toolbar:
                'undo redo | bold italic backcolor link | styles | fontsize | lineheight | ' +
                'alignleft aligncenter alignright alignjustify | ' +
                'bullist numlist outdent indent | image | removeformat',
            content_style: 'body { font-size: 14px; }',

            // Compress & convert every image to an inline JPEG base64 data URI.
            // Avoids blob: URLs (which die on page reload) and keeps payload small.
            automatic_uploads: true,
            images_upload_handler: function (blobInfo) {
                // Max 1600 px on any side, JPEG quality 0.82
                return compressImageBlob(blobInfo, 1600, 0.82);
            },

            // Allow the user to pick a local image file.
            // The selected file is read as a data URI and inserted; TinyMCE then
            // passes it through images_upload_handler for compression.
            file_picker_types: 'image',
            file_picker_callback: function (cb) {
                var input = document.createElement('input');
                input.setAttribute('type', 'file');
                input.setAttribute('accept', 'image/*');
                input.addEventListener('change', function (e) {
                    var file = e.target.files[0];
                    var reader = new FileReader();
                    reader.addEventListener('load', function () {
                        cb(reader.result, { title: file.name });
                    });
                    reader.readAsDataURL(file);
                });
                input.click();
            },

            {if $user->is_dark_mode}
            skin: 'oxide-dark',
            content_css: 'dark',
            {/if}
        });
    });
</script>
