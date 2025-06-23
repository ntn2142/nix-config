#!/usr/bin/env bash

config=$(ls ./home-manager/ | fzf)

home-manager switch --file "./home-manager/$config"
