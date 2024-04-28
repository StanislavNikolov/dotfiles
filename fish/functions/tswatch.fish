function tswatch
find src/ | entr bun build src/index.ts --outfile index.mjs
end
