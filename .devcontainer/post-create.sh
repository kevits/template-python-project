


# fix ownership of uv cache directory (may be root-owned from Docker volume mount)
# if [ -d "$UV_CACHE_DIR" ] && [ ! -w "$UV_CACHE_DIR" ]; then
#     echo "Fixing uv cache directory permissions"
#     sudo chown -R $(id -u):$(id -g) "$UV_CACHE_DIR"
# fi

# add project as safe directory 
#git config --global --add safe.directory /workspace

echo "Install uv dependencies"
uv sync

echo "Upgrading pip"
pip install --upgrade pip
