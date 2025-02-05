function ytm --wraps=yt-dlp\ -f\ mp4\ -o\ \'\~/Videos/\%\(title\)s.\%\(ext\)s\'\  --description alias\ ytm=yt-dlp\ -f\ mp4\ -o\ \'\~/Videos/\%\(title\)s.\%\(ext\)s\'\ 
  yt-dlp -f mp4 -o '~/Videos/%(title)s.%(ext)s'  $argv
        
end
