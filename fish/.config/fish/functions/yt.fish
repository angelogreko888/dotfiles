function yt --wraps=yt-dlp\ -x\ --audio-format\ mp3\ -o\ \'\~/Music/\%\(title\)s.\%\(ext\)s\' --description alias\ yt=yt-dlp\ -x\ --audio-format\ mp3\ -o\ \'\~/Music/\%\(title\)s.\%\(ext\)s\'
  yt-dlp -x --audio-format mp3 -o '~/Music/%(title)s.%(ext)s' $argv
        
end
