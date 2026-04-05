/**
 * Admin Panel Switch
 * Handles switch between admin and user panel
 */
(function () {
    var sw = document.getElementById('admin-panel-switch');
    if (!sw) {
        // If using button-based switch (Luminous style)
        var switchUser = document.getElementById('switch-user');
        var switchAdmin = document.getElementById('switch-admin');
        
        if (switchUser) {
            switchUser.addEventListener('click', function() {
                window.location.href = '/user';
            });
        }
        
        return;
    }
    
    // Checkbox-based switch
    sw.addEventListener('change', function () {
        if (!this.checked) {
            window.location.href = '/user';
        }
    });
})();
