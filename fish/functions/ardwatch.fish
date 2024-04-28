function ardwatch
  find . -name '*.ino' | entr -rc fish -ic ardcycle
end
