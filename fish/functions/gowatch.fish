function gowatch
find . -name '*.go' | entr -r go run .
end
