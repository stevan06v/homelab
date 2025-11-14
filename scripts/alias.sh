#!/bin/bash

BASHRC="$HOME/.bashrc"

# clear
if ! grep -qx "alias cls='clear'" "$BASHRC"; then
    echo "alias cls='clear'" >> "$BASHRC"
    echo "Added: alias cls='clear'"
else
    echo "alias cls already exists"
fi

# ls 
if ! grep -qx "alias ls -l='ls -lah'" "$BASHRC"; then
    echo "alias ls-lah='ls -lah'" >> "$BASHRC"
    echo "Added: alias ls-lah='ls -lah'"
else
    echo "alias ls-lah already exists"
fi

# source
if ! grep -qx "alias reload='source ~/.bashrc'" "$BASHRC"; then
    echo "alias reload='source ~/.bashrc'" >> "$BASHRC"
    echo "Added: alias reload='source ~/.bashrc'"
else
    echo "alias reload already exists"
fi

# python
if ! grep -qx "alias python='python3'" "$BASHRC"; then
    echo "alias python='python3'" >> "$BASHRC"
    echo "Added: alias python='python3'"
else
    echo "alias python already exists"
fi

echo "Done. Reload your shell with: source ~/.bashrc"

source ~/.bashrc
