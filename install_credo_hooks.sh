#!/bin/sh

echo "Installing Pre Commit Hook"
echo "Copy priv/hooks/pre-push.txt"
cp priv/hooks/pre-push.txt .git/hooks/pre-push
echo "Setting hook"
chmod +x .git/hooks/pre-push
echo "Pre push hook [installed]"
