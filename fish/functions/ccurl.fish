function ccurl --wraps='curl -c ~/.curlcookies -b ~/.curlcookies' --description 'alias ccurl=curl -c ~/.curlcookies -b ~/.curlcookies'
  curl -c ~/.curlcookies -b ~/.curlcookies $argv
        
end
