function spt --wraps='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -' --description 'alias spt=curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 - $argv
        
end
