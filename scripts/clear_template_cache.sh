#!/bin/bash

# Script để clear Smarty template cache
# Sử dụng khi không thấy thay đổi trong template

echo "🧹 Clearing Smarty template cache..."

# Clear compile cache
if [ -d "storage/framework/smarty/compile" ]; then
    rm -rf storage/framework/smarty/compile/*
    echo "✅ Cleared compile cache"
else
    echo "⚠️  Compile cache directory not found"
fi

# Clear template cache
if [ -d "storage/framework/smarty/cache" ]; then
    rm -rf storage/framework/smarty/cache/*
    echo "✅ Cleared template cache"
else
    echo "⚠️  Template cache directory not found"
fi

# Clear Twig cache (nếu có)
if [ -d "storage/framework/twig/cache" ]; then
    rm -rf storage/framework/twig/cache/*
    echo "✅ Cleared Twig cache"
fi

echo "✨ Done! Template cache cleared successfully."
echo ""
echo "💡 Tip: Reload your browser to see changes"
