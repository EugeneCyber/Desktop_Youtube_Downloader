import yt_dlp

def download_video(url):
    # Настройки для загрузки видео в формате MP4
    ydl_opts = {
        'format': 'bestvideo[ext=mp4][height<=1080]+bestaudio[ext=m4a]/best[ext=mp4][height<=1080]',
        'outtmpl': '/download/%(title)s.%(ext)s',  # Имя выходного файла
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

if __name__ == "__main__":
    url = input("[youtube] Input URL: ")
    download_video(url)
