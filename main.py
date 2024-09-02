import yt_dlp

def download_video(url):
    # Настройки для загрузки видео
    ydl_opts = {
        'format': 'bestvideo[height<=1080]+bestaudio/best[height<=1080]',
        'outtmpl': '/download/%(title)s.%(ext)s',  # Имя выходного файла
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

if __name__ == "__main__":
    url = input("[youtube] Input URL: ")
    #url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    download_video(url)
