function zigwatch
find . -name '*.zig' | entr -rc zig build run
end
