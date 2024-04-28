function vi --wraps=nvim --wraps=vim --wraps='nvim -u none' --wraps='nvim -u NONE' --description 'alias vi=nvim -u NONE'
  nvim -u NONE $argv
        
end
