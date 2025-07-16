 const video = document.querySelector('video');
        const overlay = document.querySelector('.video-overlay');
        const playButton = document.querySelector('.play-button');
        
        playButton.addEventListener('click', () => {
            video.play();
            overlay.style.display = 'none';
        });
        
        video.addEventListener('pause', () => {
            if (!video.ended) {
                overlay.style.display = 'flex';
            }
        });
        
        video.addEventListener('ended', () => {
            overlay.style.display = 'flex';
        });