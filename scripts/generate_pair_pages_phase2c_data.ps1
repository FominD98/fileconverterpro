# Phase 2c data: audio/video/ebook/svg pairs
# mp4-to-mp3, m4a-to-mp3, ogg-to-mp3, mp3-to-wav,
# webm-to-mp4, mp4-to-gif, epub-to-pdf, pdf-to-epub, svg-to-pdf, svg-to-png

$PairData = @(

    @{
        slug = 'mp4-to-mp3'
        from = 'MP4'
        to = 'MP3'
        catSlug = 'audio-converter'
        catName = 'Audio Converter'
        title = 'Convert MP4 to MP3 on Windows — Offline | File Converter Pro'
        desc = 'Convert MP4 video to MP3 audio on Windows 10 and 11 offline. Extract audio from videos in batch with no upload, no size limit, no watermark. Try free.'
        h1 = 'Convert MP4 to MP3 on Windows — Extract Audio Offline'
        heroSubtitle = 'Extract audio from MP4 videos as MP3 on Windows — batch processing, fully offline, no upload, free trial, no file size cap.'
        whyHtml = @'
                    <p>Extracting audio from MP4 video is one of the most common conversion tasks on desktop. Conference recordings, webinar replays, music video files, lecture captures, interview recordings, and podcast exports all arrive as MP4 — but you only need the audio track. <strong>Converting MP4 to MP3 strips the video stream and saves just the audio</strong> in the universally compatible MP3 format, ready for any media player, podcast app, or audio editor.</p>
                    <p>MP3 is supported by every device without exception: iPods and old iPod touches, car audio systems with USB inputs, smart speakers, smartphones, DJ mixers, and every audio editing application. If you need to extract a lecture or speech from a recorded video for review during a commute, or pull a music track from a music video, MP4 → MP3 is the cleanest path.</p>
                    <p>The conversion is essentially an audio extraction — the video stream is discarded and the audio stream is either extracted as-is or re-encoded to MP3. When the MP4 contains an AAC audio track (the most common case for iPhone and camera recordings), the conversion is a fast re-encode to MP3 at the bitrate you choose.</p>
                    <p>File Converter Pro processes MP4 → MP3 entirely offline on Windows 10 and 11. Large video files — conference recordings, university lectures, documentary source files — are processed without upload size caps or service quotas.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial includes MP4 to MP3 audio extraction.' }
            @{ name = 'Add MP4 files to the queue'; text = 'Drag MP4 video files into the app — one file, a multi-select, or an entire folder of video recordings.' }
            @{ name = 'Select MP3 output and set bitrate'; text = 'Choose MP3 as output. Set bitrate: 128 kbps for voice content and podcasts; 192 kbps for music; 320 kbps for high-quality music archives. VBR mode is available for optimal quality-to-size ratio.' }
            @{ name = 'Extract audio offline'; text = 'Click Convert. Audio extraction runs locally — no upload. A 2-hour lecture converts in about a minute. MP3 files are saved to your specified folder.' }
        )
        batchHtml = @'
                    <p>Podcast producers, corporate training teams, and educators frequently need to batch-process a series of recorded MP4 sessions into distributable MP3 audio files. File Converter Pro handles this at scale.</p>
                    <ul>
                        <li>Process an entire folder of MP4 recordings in one queue run.</li>
                        <li>Consistent bitrate and quality settings across the entire batch.</li>
                        <li>Output MP3 files retain original filenames with .mp3 extension.</li>
                        <li>No size limit — 4 GB conference recordings extract cleanly.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>128 kbps:</strong> standard quality for speech, podcasts, and voice recordings. Compact files, excellent clarity for the spoken word.</li>
                        <li><strong>192 kbps:</strong> recommended for music. Good quality-to-size balance — most listeners cannot distinguish from higher bitrates.</li>
                        <li><strong>320 kbps:</strong> highest standard MP3 bitrate. Use for music where quality is paramount or when the output may be re-encoded further.</li>
                        <li><strong>VBR (variable bitrate):</strong> intelligently assigns higher bitrate to complex audio passages and lower to silence/simple sections. Best quality-per-kilobyte for music.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Output MP3 is silent or has no sound.</strong> The MP4 may have multiple audio tracks and the first track is a commentary or alternate language. Select the correct audio track in the settings before converting.</li>
                        <li><strong>MP3 is much shorter than the video.</strong> An extract start/end point may have been set accidentally. Verify that the full duration is selected in the output settings.</li>
                        <li><strong>Audio quality worse than expected.</strong> MP4 video often uses AAC audio — re-encoding AAC to MP3 involves two lossy steps. Use the highest practical bitrate (192-320 kbps) to minimise quality loss from double compression.</li>
                        <li><strong>Video file not added to queue.</strong> Ensure the file has a .mp4 extension. Some cameras save MP4 video with .mov or .m4v extensions — these are also supported by File Converter Pro.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/m4a-to-mp3/'; label = 'Convert M4A to MP3 (Apple audio to universal)' }
            @{ href = '/en/convert/wav-to-mp3/'; label = 'Convert WAV to MP3 (reduce audio file size)' }
            @{ href = '/en/convert/ogg-to-mp3/'; label = 'Convert OGG to MP3 (open format to universal)' }
            @{ href = '/en/convert/mkv-to-mp4/'; label = 'Convert MKV to MP4 (video container)' }
            @{ href = '/en/converters/audio-converter/'; label = 'Browse all audio conversions' }
        )
        faqs = @(
            @{ q = 'Does converting MP4 to MP3 keep the full audio quality?'; a = 'At 192 kbps or higher, the quality loss from MP4 AAC to MP3 is minimal and inaudible for most content. Use 320 kbps for music archives where quality is most important.' }
            @{ q = 'How long does MP4 to MP3 conversion take?'; a = 'Audio extraction is very fast — a 2-hour 1080p MP4 lecture produces an MP3 in about 60-90 seconds on a modern Windows laptop. Only the audio stream is processed, not the video.' }
            @{ q = 'Can I batch-convert a folder of MP4 recordings to MP3?'; a = 'Yes. Drag the folder into File Converter Pro and all MP4 files are added to the queue. All audio is extracted to MP3 in one run.' }
            @{ q = 'Is the conversion completely offline?'; a = 'Yes. File Converter Pro extracts audio entirely on your Windows PC. Large lecture and conference files do not need to be uploaded anywhere.' }
        )
        outputOptions = @(
            'MP3 CBR 64 / 128 / 192 / 256 / 320 kbps'
            'MP3 VBR mode'
            'Multiple audio track selection'
            'Trim start/end point'
            'ID3 metadata preserve'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and extract audio from your MP4 videos to MP3 offline — batch any number of files, no upload, no size cap, free trial.'
    },

    @{
        slug = 'm4a-to-mp3'
        from = 'M4A'
        to = 'MP3'
        catSlug = 'audio-converter'
        catName = 'Audio Converter'
        title = 'Convert M4A to MP3 on Windows — Offline | File Converter Pro'
        desc = 'Convert M4A (Apple AAC audio) to MP3 on Windows 10 and 11 offline. Batch-convert iTunes and iPhone voice memos with no upload, no size limit. Try free.'
        h1 = 'Convert M4A to MP3 on Windows — Offline &amp; Batch'
        heroSubtitle = 'Convert Apple M4A audio files to universally compatible MP3 on Windows — no iTunes needed, batch processing, fully offline, free trial.'
        whyHtml = @'
                    <p>M4A is Apple''s AAC audio container used for iTunes purchases, Apple Music downloads, iPhone voice memos, GarageBand exports, and audio recorded in iOS apps. While AAC quality is excellent, <strong>M4A playback is not universal</strong>: many non-Apple media players, older car stereos, MP3 players, DJ software, and legacy audio editing tools expect MP3 specifically.</p>
                    <p>Converting M4A to MP3 makes Apple audio files playable on every device. It is the most common need for users who have purchased music from iTunes and want to play it in software or hardware that does not support M4A/AAC natively. iPhone voice memos and GarageBand recordings exported as M4A also often need to be converted for submission to platforms that only accept MP3.</p>
                    <p>File Converter Pro converts M4A to MP3 on Windows 10 and 11 without needing iTunes or any other Apple software. The conversion is entirely offline — your personal music library and private voice recordings are processed locally without any upload to a cloud service.</p>
                    <p>Note: converting DRM-protected M4A files purchased from iTunes is not supported (Apple''s Fairplay DRM prevents third-party conversion). DRM-free M4A files — including Apple Music downloads that are DRM-free, voice memos, and GarageBand exports — convert without issues.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. No iTunes installation required. The free trial supports M4A to MP3 conversion.' }
            @{ name = 'Add M4A files to the queue'; text = 'Drag M4A files or a folder into the app. iPhone voice memos (.m4a), iTunes exports (.m4a), and GarageBand exports (.m4a) are all accepted.' }
            @{ name = 'Set MP3 bitrate'; text = 'Choose bitrate: 128 kbps for voice content; 192 kbps for general music; 320 kbps for highest quality. VBR mode gives optimal quality-per-kilobyte.' }
            @{ name = 'Convert locally'; text = 'Click Convert. MP3 files are produced on your Windows PC without any upload. Processing is fast — roughly 5-10× real-time speed.' }
        )
        batchHtml = @'
                    <p>Users with large M4A music libraries or folders of voice memos can process everything in one batch job.</p>
                    <ul>
                        <li>Convert entire iTunes library folders from M4A to MP3 in one run.</li>
                        <li>No per-file size limit — long audiobooks and podcasts in M4A format convert cleanly.</li>
                        <li>ID3 metadata (artist, album, track title) is transferred from M4A tags to MP3 ID3 tags.</li>
                        <li>Output files keep original names with .mp3 extension.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>M4A/AAC is already a lossy format. Converting to MP3 applies a second round of lossy compression. To minimise quality degradation:</p>
                    <ul>
                        <li><strong>192 kbps (recommended for music):</strong> the standard sweet spot. Most listeners cannot detect quality loss from AAC 256 to MP3 192 at this setting.</li>
                        <li><strong>320 kbps:</strong> maximum standard MP3 quality. Use when the M4A source was high-bitrate (256+ kbps) and quality preservation is paramount.</li>
                        <li><strong>128 kbps:</strong> compact size for voice content, podcasts, and audiobooks where audio complexity is lower.</li>
                        <li><strong>VBR:</strong> variable bitrate assigns bits intelligently — best for music with varied dynamics.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Error: "DRM-protected file."</strong> iTunes Store purchases may be DRM-protected. DRM prevents third-party conversion. DRM-free music (Apple Music since 2009, voice memos, GarageBand exports) converts fine.</li>
                        <li><strong>Metadata missing in output MP3.</strong> Enable "copy metadata" in the output settings. M4A tags are mapped to corresponding MP3 ID3 fields.</li>
                        <li><strong>Audio sounds slightly different.</strong> This is expected from AAC-to-MP3 transcoding. Use 192+ kbps to keep differences inaudible.</li>
                        <li><strong>File not added to queue.</strong> Some Apple devices save audio as .m4a but rename the extension. If the file fails to load, verify its actual format or try renaming the extension to .m4a.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/mp4-to-mp3/'; label = 'Convert MP4 to MP3 (extract audio from video)' }
            @{ href = '/en/convert/wav-to-mp3/'; label = 'Convert WAV to MP3 (reduce audio size)' }
            @{ href = '/en/convert/flac-to-mp3/'; label = 'Convert FLAC to MP3 (lossless to universal)' }
            @{ href = '/en/convert/aac-to-mp3/'; label = 'Convert AAC to MP3 (AAC audio to MP3)' }
            @{ href = '/en/converters/audio-converter/'; label = 'Browse all audio conversions' }
        )
        faqs = @(
            @{ q = 'Do I need iTunes installed to convert M4A to MP3?'; a = 'No. File Converter Pro uses its own built-in audio codec and does not require iTunes, Apple Music, or any other Apple software on Windows.' }
            @{ q = 'Can I convert DRM-protected M4A from iTunes?'; a = 'No. DRM (Fairplay) protection prevents third-party conversion. DRM-free M4A files — Apple Music downloads (since 2009), voice memos, GarageBand exports — convert without issues.' }
            @{ q = 'Will album art and track metadata be preserved in the MP3?'; a = 'Yes. Enable metadata copying in the output settings. Artist, album, track title, year, and album artwork are transferred from the M4A to MP3 ID3 tags.' }
            @{ q = 'How many M4A files can I convert at once?'; a = 'No limit. Drop an entire folder of M4A files into File Converter Pro and the batch processes all of them. Large audiobooks and full album collections are handled.' }
        )
        outputOptions = @(
            'MP3 CBR 128 / 192 / 256 / 320 kbps'
            'MP3 VBR mode'
            'ID3 metadata transfer'
            'Album art preserved'
            'Batch folder processing'
            'No Apple software required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your M4A audio library to MP3 offline — no iTunes needed, no upload, no watermark, free trial.'
    },

    @{
        slug = 'ogg-to-mp3'
        from = 'OGG'
        to = 'MP3'
        catSlug = 'audio-converter'
        catName = 'Audio Converter'
        title = 'Convert OGG to MP3 on Windows — Offline | File Converter Pro'
        desc = 'Convert OGG Vorbis audio to MP3 on Windows 10 and 11 offline. Batch-convert open-format audio files to universal MP3. No upload, no watermark. Try free.'
        h1 = 'Convert OGG to MP3 on Windows — Offline &amp; Batch'
        heroSubtitle = 'Convert OGG Vorbis audio files to universally compatible MP3 on Windows — offline, batch processing, no upload, free trial.'
        whyHtml = @'
                    <p>OGG (Ogg Vorbis) is an open-source, patent-free audio format used by many games, Linux applications, and open-source media projects. The format is excellent technically, but <strong>hardware support is limited</strong>: most dedicated MP3 players, car stereos, smart speakers, and legacy audio applications do not recognise .ogg files. Converting OGG to MP3 gives you a file that plays on everything.</p>
                    <p>Game developers export audio assets in OGG format for royalty-free in-game use. Linux users may have music collections in OGG from the GNOME or KDE music player defaults. Open-source podcast editors and recording tools often produce OGG output by default. When these files need to be shared or played on standard Windows software or hardware devices, MP3 is the practical choice.</p>
                    <p>OGG Vorbis audio quality at comparable bitrates is slightly better than MP3 — but when the destination device does not support OGG, that quality advantage is irrelevant. File Converter Pro converts OGG to MP3 at the bitrate you specify, with the full ID3 metadata support that MP3 listeners and players expect.</p>
                    <p>All conversion runs offline on Windows 10 and 11. No Ogg or MP3 files are uploaded to any server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes OGG to MP3 conversion.' }
            @{ name = 'Add OGG files to the queue'; text = 'Drag OGG audio files or a folder into the app. Game asset folders and music library directories containing .ogg files are all processed.' }
            @{ name = 'Set MP3 bitrate'; text = '128 kbps for voice and simple audio; 192 kbps for music; 320 kbps for highest fidelity. VBR is available for optimal size-quality ratio.' }
            @{ name = 'Convert offline'; text = 'Click Convert. MP3 files are saved to your output folder. OGG to MP3 conversion is fast — typically 10-20× real-time.' }
        )
        batchHtml = @'
                    <p>Game audio export, music library migrations, and multimedia project asset conversions often involve large folders of OGG files. File Converter Pro handles these without limits.</p>
                    <ul>
                        <li>Convert an entire game audio asset folder or music library in one run.</li>
                        <li>All .ogg files in subfolders are included when folder processing is enabled.</li>
                        <li>Metadata from OGG Vorbis comments is mapped to MP3 ID3 tags.</li>
                        <li>No file count or size limits.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>192 kbps CBR (recommended for music):</strong> standard quality, widely compatible.</li>
                        <li><strong>320 kbps CBR:</strong> highest standard MP3 quality. Use when source OGG was high-quality and you want minimal transcoding loss.</li>
                        <li><strong>128 kbps:</strong> compact, appropriate for voice and sound effects.</li>
                        <li><strong>VBR V2 (~190 kbps average):</strong> excellent for music — gives transparent quality at about 80% of the 320 kbps file size.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Output MP3 has slight quality difference from OGG.</strong> Both OGG Vorbis and MP3 are lossy — transcoding always incurs some quality loss. Use 192-320 kbps to keep this minimal.</li>
                        <li><strong>Metadata not transferred.</strong> OGG stores metadata as Vorbis Comments; MP3 uses ID3 tags. Ensure "copy metadata" is enabled. Artist, title, album, and track number are mapped automatically.</li>
                        <li><strong>Some OGG files not recognised.</strong> Some files saved with .ogg extension are actually Opus audio (not Vorbis). File Converter Pro supports both OGG/Vorbis and OGG/Opus formats.</li>
                        <li><strong>Long batch runs slowly.</strong> OGG decoding and MP3 encoding are CPU-intensive. Allow the batch to complete — close other heavy applications for faster processing.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/mp4-to-mp3/'; label = 'Convert MP4 to MP3 (extract audio from video)' }
            @{ href = '/en/convert/wav-to-mp3/'; label = 'Convert WAV to MP3 (reduce audio size)' }
            @{ href = '/en/convert/flac-to-mp3/'; label = 'Convert FLAC to MP3 (lossless to universal)' }
            @{ href = '/en/convert/m4a-to-mp3/'; label = 'Convert M4A to MP3 (Apple audio to MP3)' }
            @{ href = '/en/converters/audio-converter/'; label = 'Browse all audio conversions' }
        )
        faqs = @(
            @{ q = 'Why does my device not play OGG files?'; a = 'OGG Vorbis is an open-source format with excellent software support but limited hardware support. Most dedicated MP3 players, car stereos, and legacy audio hardware only support MP3 and AAC. Converting to MP3 guarantees universal playback.' }
            @{ q = 'Will converting OGG to MP3 reduce audio quality?'; a = 'Yes, some quality is lost because both formats are lossy. At 192 kbps or higher the degradation is minimal and inaudible for most listeners. Use 320 kbps to minimise loss when quality is critical.' }
            @{ q = 'Can I batch-convert a folder of OGG game assets to MP3?'; a = 'Yes. Drop the entire folder into File Converter Pro and all .ogg files are converted in one batch run.' }
            @{ q = 'Is the conversion offline?'; a = 'Yes. File Converter Pro converts OGG to MP3 entirely on your Windows PC without any uploads.' }
        )
        outputOptions = @(
            'MP3 CBR 128 / 192 / 256 / 320 kbps'
            'MP3 VBR mode'
            'Vorbis comments to ID3 metadata'
            'OGG Vorbis and OGG Opus supported'
            'Batch folder processing'
            'No upload required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your OGG audio files to universally compatible MP3 offline — no upload, no watermark, free trial.'
    },

    @{
        slug = 'mp3-to-wav'
        from = 'MP3'
        to = 'WAV'
        catSlug = 'audio-converter'
        catName = 'Audio Converter'
        title = 'Convert MP3 to WAV on Windows — Offline | File Converter Pro'
        desc = 'Convert MP3 to WAV on Windows 10 and 11 offline. Expand compressed audio to uncompressed WAV for editing, broadcast, and hardware compatibility. Try free.'
        h1 = 'Convert MP3 to WAV on Windows — Uncompressed Audio Offline'
        heroSubtitle = 'Decode MP3 audio to uncompressed WAV on Windows — for audio editing, broadcast, and hardware compatibility, fully offline, free trial.'
        whyHtml = @'
                    <p>WAV (Waveform Audio File Format) is the standard uncompressed audio format for professional audio workflows. Digital audio workstations (DAWs), broadcast playout systems, video editing software, hardware samplers, and many DJ controllers all prefer or require uncompressed WAV over compressed MP3. <strong>Converting MP3 to WAV gives you the uncompressed format that professional audio tools expect</strong>.</p>
                    <p>Common MP3 to WAV scenarios: importing MP3 tracks into Audacity, Adobe Audition, or Pro Tools for editing (these tools accept MP3 but render or master to WAV); loading tracks into a hardware DJ controller or sampler that only reads WAV; fulfilling a broadcast submission requirement that mandates uncompressed audio; and preparing audio for use in a video project that requires WAV source files for syncing.</p>
                    <p>It is important to understand that decoding MP3 to WAV does not recover the audio quality lost during the original MP3 encoding. WAV is a container format — the MP3 audio is decoded to PCM samples and stored in WAV, but the lossy artefacts present in the MP3 are preserved in the WAV output. The result is a file that is uncompressed in format but was originally lossy in quality.</p>
                    <p>File Converter Pro handles the conversion entirely offline on Windows 10 and 11. No upload is required — batch-convert your entire MP3 library to WAV for a studio session without internet access.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes MP3 to WAV conversion.' }
            @{ name = 'Add MP3 files to the queue'; text = 'Drag MP3 files or a folder into the app. Any MP3 bitrate and any sample rate is accepted as input.' }
            @{ name = 'Select WAV output settings'; text = 'Choose WAV as output. Set bit depth (16-bit standard, 24-bit for pro audio) and sample rate (44100 Hz for CD-quality, 48000 Hz for video/broadcast).' }
            @{ name = 'Convert offline'; text = 'Click Convert. WAV files are generated locally. MP3 decoding to WAV is very fast — roughly 50-100× real-time.' }
        )
        batchHtml = @'
                    <p>Studio preparation sessions and broadcast archive conversion often require converting entire MP3 libraries to WAV in one batch. File Converter Pro handles this efficiently.</p>
                    <ul>
                        <li>Convert an entire MP3 library folder to WAV in one queue run.</li>
                        <li>Consistent bit depth and sample rate settings across the batch.</li>
                        <li>ID3 metadata from MP3 is carried over to BWF (Broadcast Wave Format) chunks in WAV.</li>
                        <li>Works offline — no internet connection needed.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>16-bit / 44100 Hz (CD quality):</strong> the standard for consumer audio. Correct for most MP3-to-WAV use cases.</li>
                        <li><strong>24-bit / 48000 Hz (broadcast):</strong> required by many broadcast systems and DAWs. More headroom for mixing, compatible with video production workflows.</li>
                        <li><strong>24-bit / 96000 Hz (high-res):</strong> only useful when the source MP3 was originally sampled at high rate — rare for MP3 files but sometimes needed for hardware compatibility.</li>
                        <li><strong>Note:</strong> upsampling the bit depth does not recover MP3 compression artefacts. The WAV quality is limited by the original MP3 quality.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>WAV file sounds the same quality as MP3.</strong> Correct and expected — MP3 to WAV decoding does not add quality. The WAV contains the same audio data as the MP3, just in uncompressed form.</li>
                        <li><strong>WAV files are very large.</strong> A 4-minute MP3 at 4 MB becomes a 40+ MB WAV at CD quality. This is normal — WAV is uncompressed. Ensure you have adequate storage before batch-converting a large library.</li>
                        <li><strong>Sample rate mismatch in DAW.</strong> Set the WAV output sample rate to match your DAW project sample rate (44100 or 48000 Hz) to avoid resampling artefacts in the session.</li>
                        <li><strong>ID3 metadata not in WAV.</strong> WAV uses INFO or BWF metadata, not ID3. Enable metadata copy in settings; some DAWs read WAV metadata differently from MP3.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/wav-to-mp3/'; label = 'Convert WAV to MP3 (reduce WAV file size)' }
            @{ href = '/en/convert/flac-to-mp3/'; label = 'Convert FLAC to MP3 (lossless to compressed)' }
            @{ href = '/en/convert/mp4-to-mp3/'; label = 'Convert MP4 to MP3 (extract video audio)' }
            @{ href = '/en/convert/m4a-to-mp3/'; label = 'Convert M4A to MP3 (Apple audio to MP3)' }
            @{ href = '/en/converters/audio-converter/'; label = 'Browse all audio conversions' }
        )
        faqs = @(
            @{ q = 'Does converting MP3 to WAV improve audio quality?'; a = 'No. WAV is an uncompressed container format. Decoding MP3 to WAV gives you an uncompressed file, but the audio quality is exactly the same as the source MP3 — the lossy compression artefacts remain. Use WAV for workflow compatibility, not quality improvement.' }
            @{ q = 'Why is my WAV file 10x larger than the MP3?'; a = 'MP3 uses lossy compression to reduce file size dramatically. WAV stores uncompressed PCM samples — a 4-minute MP3 at 4 MB becomes roughly 40 MB as a 44100 Hz 16-bit WAV. This is normal.' }
            @{ q = 'What sample rate should I use for MP3 to WAV?'; a = '44100 Hz (CD quality) for general use. 48000 Hz for video production and broadcast workflows. Match your DAW project sample rate for best compatibility.' }
            @{ q = 'Can I batch-convert an MP3 library to WAV?'; a = 'Yes. Drop the folder into File Converter Pro and all MP3 files are converted to WAV in one run. The output WAVs are saved in your specified folder.' }
        )
        outputOptions = @(
            '16-bit or 24-bit PCM'
            '44100 / 48000 / 96000 Hz sample rate'
            'BWF metadata support'
            'Stereo or mono output'
            'Batch folder processing'
            'No upload required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your MP3 files to uncompressed WAV offline — batch processing, pro audio settings, no upload, free trial.'
    },

    @{
        slug = 'webm-to-mp4'
        from = 'WebM'
        to = 'MP4'
        catSlug = 'video-converter'
        catName = 'Video Converter'
        title = 'Convert WebM to MP4 on Windows — Offline | File Converter Pro'
        desc = 'Convert WebM video to MP4 on Windows 10 and 11 offline. Re-encode VP8/VP9/AV1 WebM to H.264 MP4 in batch. No upload, no watermark. Free trial.'
        h1 = 'Convert WebM to MP4 on Windows — Offline &amp; Batch'
        heroSubtitle = 'Re-encode WebM videos to universally compatible MP4 on Windows — VP8, VP9, AV1 all supported, fully offline, free trial.'
        whyHtml = @'
                    <p>WebM is the browser-native video format — optimised for streaming in Chrome, Firefox, and web players, but <strong>not universally supported outside the browser</strong>. iOS and older macOS do not play WebM natively. Media players like VLC can open WebM, but social platforms (Instagram, TikTok, LinkedIn), video editing software (Premiere, iMovie, Final Cut), and hardware devices (smart TVs, consoles, projectors) all prefer MP4 with H.264 encoding.</p>
                    <p>WebM files are commonly downloaded from web tools, web scrapers, browser captures, and HTML5 video elements. Screen recorders like OBS can record in WebM. Video conferencing tools sometimes export to WebM. When any of these outputs need to be shared, edited, or played on non-browser hardware, converting to MP4 is the practical step.</p>
                    <p>File Converter Pro re-encodes WebM (VP8, VP9, or AV1 video with Vorbis or Opus audio) to MP4 (H.264 or H.265 video with AAC audio) entirely offline on Windows 10 and 11. There is no size cap — large OBS recordings and web-conference exports are handled just as smoothly as short clips.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes WebM to MP4 conversion.' }
            @{ name = 'Add WebM files to the queue'; text = 'Drag WebM files or a folder into the app. VP8, VP9, and AV1 WebM files are all accepted.' }
            @{ name = 'Select MP4 output codec'; text = 'Choose H.264 MP4 for maximum device compatibility, or H.265 MP4 for smaller files at the same quality. Set CRF or bitrate target.' }
            @{ name = 'Convert offline'; text = 'Click Convert. Re-encoding runs locally on your CPU — no upload. Output MP4s are saved to your folder.' }
        )
        batchHtml = @'
                    <p>OBS recording archives, downloaded web video assets, and WebM export folders from HTML5 tools can be batch-converted to MP4 in one run.</p>
                    <ul>
                        <li>Convert entire folders of WebM files to MP4 in one queue run.</li>
                        <li>VP8, VP9, and AV1 are all decoded automatically.</li>
                        <li>Consistent codec and quality settings applied across the batch.</li>
                        <li>No size limit — large OBS recordings and conference exports are handled.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>H.264 CRF 23 (default):</strong> excellent quality, small file, universal device support.</li>
                        <li><strong>H.264 bitrate mode:</strong> use when you need exact file size control for platform upload limits.</li>
                        <li><strong>H.265 CRF 28:</strong> same quality as H.264 CRF 23 but roughly 50% smaller file. Slightly slower encoding.</li>
                        <li><strong>Audio:</strong> Opus/Vorbis from WebM is re-encoded to AAC 128-256 kbps for MP4 compatibility.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>AV1 WebM conversion is slow.</strong> AV1 decoding is CPU-intensive. Reduce resolution or use hardware-accelerated decoding if available on your GPU.</li>
                        <li><strong>Audio desync in output MP4.</strong> Some WebM files from web tools have audio/video timing issues. File Converter Pro''s re-mux step corrects timestamp inconsistencies in most cases.</li>
                        <li><strong>Output quality different from WebM source.</strong> Re-encoding always involves some quality change. At CRF 23 (H.264) the visual difference from a good VP9 source is minimal.</li>
                        <li><strong>Black frames at start or end.</strong> Some WebM files have extra empty frames. Trim start and end points in the conversion settings to remove them.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/mkv-to-mp4/'; label = 'Convert MKV to MP4 (remux or re-encode)' }
            @{ href = '/en/convert/mov-to-mp4/'; label = 'Convert MOV to MP4 (iPhone/Mac video to MP4)' }
            @{ href = '/en/convert/mp4-to-webm/'; label = 'Convert MP4 to WebM (MP4 to web-optimised)' }
            @{ href = '/en/converters/video-converter/'; label = 'Browse all video conversions' }
        )
        faqs = @(
            @{ q = 'Why does iOS not play WebM files?'; a = 'Apple has not added WebM support to iOS or older macOS — Safari and iOS devices do not have a VP8/VP9/AV1 decoder. Converting to H.264 MP4 gives universal playback on all Apple devices.' }
            @{ q = 'Which WebM codec variants does File Converter Pro support?'; a = 'VP8, VP9, and AV1 video, with Vorbis and Opus audio. All three WebM video codecs are decoded to H.264 or H.265 MP4.' }
            @{ q = 'Will re-encoding WebM to MP4 reduce quality?'; a = 'Re-encoding always involves some quality change. At CRF 23 (H.264) the difference from a high-quality VP9 source is minimal and often visually indistinguishable at normal viewing distance.' }
            @{ q = 'Can I batch-convert WebM OBS recordings to MP4?'; a = 'Yes. Drop the folder into File Converter Pro and all WebM files are converted to MP4 in one batch run.' }
        )
        outputOptions = @(
            'H.264 or H.265 MP4 output'
            'CRF or bitrate target mode'
            'VP8 / VP9 / AV1 input codecs'
            'AAC audio output'
            'Trim start/end point'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your WebM videos to universally compatible MP4 offline — VP8, VP9, AV1 all supported, no upload, no watermark, free trial.'
    },

    @{
        slug = 'mp4-to-gif'
        from = 'MP4'
        to = 'GIF'
        catSlug = 'video-converter'
        catName = 'Video Converter'
        title = 'Convert MP4 to GIF on Windows — Offline | File Converter Pro'
        desc = 'Convert MP4 clips to animated GIF on Windows 10 and 11 offline. Control frame rate, size, and duration. No upload, no watermark, no size limit. Try free.'
        h1 = 'Convert MP4 to GIF on Windows — Animated GIF Maker'
        heroSubtitle = 'Create animated GIFs from MP4 video clips on Windows — control frame rate and resolution, fully offline, no upload, free trial.'
        whyHtml = @'
                    <p>Animated GIF is the universal format for short looping animations in chat apps, social media, documentation, and web pages. Slack, Discord, Teams, GitHub, Reddit, and Twitter all support GIF natively. <strong>Converting a short MP4 clip to GIF</strong> lets you share a product demo, reaction clip, tutorial step, or screen recording in a format that plays everywhere without a video player.</p>
                    <p>Developers use MP4-to-GIF to create animated documentation screenshots (showing a UI interaction in a bug report or README). Marketers create product feature GIFs for social posts. Customer success teams add GIF tutorials to support articles. Designers export motion prototypes from Figma as MP4 and share them as GIFs in design reviews.</p>
                    <p>GIF has a 256-colour palette limitation and no audio — it is best for short clips (2-10 seconds) with limited colour variation. For clips with complex gradients or live footage, WebP animated format produces significantly better quality at smaller file sizes, but GIF remains the only format with guaranteed universal display support in every messaging app and email client.</p>
                    <p>File Converter Pro creates animated GIFs from MP4 clips entirely offline on Windows 10 and 11. Control the frame rate, output resolution, and clip duration to generate the optimal GIF for your use case.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes MP4 to GIF conversion.' }
            @{ name = 'Add MP4 clips to the queue'; text = 'Drag MP4 clips into the app. Set start and end time for the GIF clip if you only need a portion of the video.' }
            @{ name = 'Configure GIF settings'; text = 'Set output resolution (320-640 px width is typical for GIFs), frame rate (10-15 fps balances quality and file size), and loop count (0 = infinite loop).' }
            @{ name = 'Generate GIF offline'; text = 'Click Convert. The animated GIF is created locally on your PC — no upload. File size is shown before you export so you can adjust settings.' }
        )
        batchHtml = @'
                    <p>Documentation teams and content creators who regularly produce GIF assets can batch-convert clip sets in one queue run.</p>
                    <ul>
                        <li>Process multiple MP4 clips to individual GIFs in one batch.</li>
                        <li>Consistent quality and size settings applied across the batch.</li>
                        <li>Start/end time can be set per clip for precise extraction.</li>
                        <li>No upload — proprietary product recordings stay local.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>Frame rate 10 fps:</strong> good for slow UI interactions. Compact file size.</li>
                        <li><strong>Frame rate 15 fps:</strong> smooth motion for most content. Balanced size and quality.</li>
                        <li><strong>Frame rate 24 fps:</strong> smooth video-like motion. Larger file — use only for short clips.</li>
                        <li><strong>Resolution 480 px width:</strong> standard for web and chat. Keep dimensions small — GIF at 480 px looks good in chat apps. Larger GIFs are rejected by some platforms (Slack max is 100 MB; Discord 8 MB for free users).</li>
                        <li><strong>Dithering:</strong> enables smoother gradients within the 256-colour palette. Adds slight file size but significantly improves appearance on photographic content.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>GIF file too large for upload.</strong> Reduce resolution (try 320 px width), lower frame rate to 10 fps, or shorten the clip duration. GIF is not efficient for long or high-resolution clips.</li>
                        <li><strong>Colours look washed out or banded.</strong> Enable dithering in the output settings. The 256-colour palette causes banding on photographic content; dithering reduces this significantly.</li>
                        <li><strong>GIF does not loop.</strong> Set the loop count to 0 (infinite) in the output settings. Some email clients do not loop GIFs after the first play.</li>
                        <li><strong>Motion looks jerky.</strong> Increase frame rate to 15-24 fps. At 10 fps, fast motion clips look choppy — increase for smooth animation.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/mp4-to-mp3/'; label = 'Convert MP4 to MP3 (extract audio from video)' }
            @{ href = '/en/convert/mp4-to-webm/'; label = 'Convert MP4 to WebM (web-optimised video)' }
            @{ href = '/en/convert/mkv-to-mp4/'; label = 'Convert MKV to MP4 (video container conversion)' }
            @{ href = '/en/converters/video-converter/'; label = 'Browse all video conversions' }
        )
        faqs = @(
            @{ q = 'What is the best frame rate for MP4 to GIF?'; a = '10-15 fps is the sweet spot for most GIFs. It gives smooth enough motion while keeping file size manageable. Use 24 fps only for short clips where smooth motion is critical.' }
            @{ q = 'How long should a GIF clip be?'; a = 'Keep GIFs under 10 seconds for best file size and compatibility. Shorter is better — 3-6 seconds is ideal for social media and chat apps. Longer clips produce very large GIF files.' }
            @{ q = 'Is there a file size limit for GIFs?'; a = 'File Converter Pro has no limit, but platforms do: Discord free tier 8 MB, Slack 100 MB, Giphy 100 MB, Twitter 15 MB. Check your target platform and adjust resolution and frame rate accordingly.' }
            @{ q = 'Can I select a specific portion of an MP4 to convert to GIF?'; a = 'Yes. Set the start time and end time in the conversion settings to extract only the clip you want as a GIF.' }
        )
        outputOptions = @(
            'Frame rate 1-30 fps'
            'Resolution up to 1080 px'
            'Loop count 0 (infinite) or fixed'
            'Dithering for colour quality'
            'Trim start/end time'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and create animated GIFs from your MP4 clips offline — frame rate and resolution control, no upload, no watermark, free trial.'
    },

    @{
        slug = 'epub-to-pdf'
        from = 'EPUB'
        to = 'PDF'
        catSlug = 'document-converter'
        catName = 'Document Converter'
        title = 'Convert EPUB to PDF on Windows — Offline | File Converter Pro'
        desc = 'Convert EPUB ebooks to PDF on Windows 10 and 11 offline. Fixed-layout PDFs from reflowable EPUB books. No upload, no DRM bypass, no watermark. Try free.'
        h1 = 'Convert EPUB to PDF on Windows — Offline &amp; Batch'
        heroSubtitle = 'Export EPUB ebooks to fixed-layout PDF on Windows — offline, no e-reader software needed, batch processing, free trial.'
        whyHtml = @'
                    <p>EPUB is the standard reflowable ebook format, adapting text flow to screen size. PDF is the standard fixed-layout document format. <strong>Converting EPUB to PDF gives you a fixed, printable version</strong> of an ebook — the layout is locked at a specific page size, making it suitable for reading offline in any PDF viewer, printing, or embedding as a document rather than using an e-reader app.</p>
                    <p>EPUB to PDF conversion is useful when: you want to read an ebook in a PDF viewer without installing Kindle or Calibre; you need to print a physical copy of an ebook document; you want to annotate the ebook using your existing PDF annotation workflow; or you need to embed specific book pages into a report or presentation as fixed-layout content.</p>
                    <p>Note: File Converter Pro converts DRM-free EPUB files only. EPUB files protected by Adobe Digital Editions DRM or Kindle DRM cannot be converted by any third-party software without removing the DRM first — which is a separate legal consideration in your jurisdiction.</p>
                    <p>All conversion runs offline on your Windows 10 or 11 PC. Your ebook files are never uploaded to any server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes EPUB to PDF conversion for DRM-free files.' }
            @{ name = 'Add EPUB files to the queue'; text = 'Drag DRM-free EPUB files into the app. EPUB 2 and EPUB 3 formats are both supported.' }
            @{ name = 'Set PDF output settings'; text = 'Choose page size (A4, Letter, or e-reader dimensions like 6"×9"). Set font size and margin if desired — the EPUB text reflows to the PDF page size.' }
            @{ name = 'Convert offline'; text = 'Click Convert. PDFs are generated locally. A 300-page novel converts in under 30 seconds.' }
        )
        batchHtml = @'
                    <p>Researchers and educators who work with EPUB book collections can batch-convert to PDF for annotation, printing, or distribution in a controlled environment.</p>
                    <ul>
                        <li>Convert folders of EPUB books to PDF in one batch run.</li>
                        <li>EPUB 2 and EPUB 3 both handled.</li>
                        <li>Consistent page size and font settings across the batch.</li>
                        <li>No upload — private ebook collections stay local.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>A4 / Letter page size:</strong> standard for printing or document workflows. Reflowable EPUB content reformats to fill the page.</li>
                        <li><strong>E-reader dimensions (6"×9"):</strong> produces a PDF that visually resembles the ebook in a standard e-reader — useful for sharing the reading experience without requiring an app.</li>
                        <li><strong>Font size:</strong> set base font size to control line length and readability in the PDF output.</li>
                        <li><strong>Embedded fonts:</strong> EPUB fonts are embedded in the PDF where available for consistent typography.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Error: DRM protected.</strong> The EPUB has Adobe Digital Editions DRM. File Converter Pro can only convert DRM-free EPUBs. Remove DRM separately if legally permitted in your jurisdiction before converting.</li>
                        <li><strong>Images missing in PDF.</strong> The EPUB used external linked images rather than embedded ones. Ensure the EPUB is a fully self-contained file (all assets inside the .epub archive).</li>
                        <li><strong>Layout looks different from e-reader.</strong> EPUB is reflowable — layout always changes when converting to a fixed-page PDF. This is expected behaviour.</li>
                        <li><strong>Non-Latin text not displaying.</strong> Ensure a font that covers the required character set is selected. File Converter Pro bundles fonts for most major scripts.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/pdf-to-epub/'; label = 'Convert PDF to EPUB (back to reflowable ebook)' }
            @{ href = '/en/convert/word-to-pdf/'; label = 'Convert Word to PDF (document to fixed-layout)' }
            @{ href = '/en/convert/pdf-to-word/'; label = 'Convert PDF to Word (editable document)' }
            @{ href = '/en/converters/document-converter/'; label = 'Browse all document conversions' }
        )
        faqs = @(
            @{ q = 'Can File Converter Pro convert DRM-protected EPUB to PDF?'; a = 'No. DRM protection prevents conversion by any third-party software. Only DRM-free EPUB files can be converted. Check your ebook source — books from many independent publishers and Project Gutenberg are DRM-free.' }
            @{ q = 'What page size should I use for EPUB to PDF?'; a = 'A4 or Letter for printing or document workflows. Use 6"×9" or custom e-reader dimensions for a PDF that looks like a typical paperback — useful for e-ink reading.' }
            @{ q = 'Does the EPUB formatting carry over to PDF?'; a = 'Basic formatting (headings, paragraphs, emphasis, chapter breaks) converts correctly. Complex EPUB layouts with fixed positioning may not render identically in the reflowed PDF.' }
            @{ q = 'Is the conversion offline?'; a = 'Yes. File Converter Pro converts EPUB to PDF entirely on your Windows PC. Your ebook files are not uploaded to any server.' }
        )
        outputOptions = @(
            'A4 / Letter / custom page size'
            'EPUB 2 and EPUB 3 support'
            'Font size control'
            'Embedded font support'
            'Batch folder processing'
            'DRM-free files only'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your DRM-free EPUB ebooks to PDF offline — print-ready, no upload, no watermark, free trial.'
    },

    @{
        slug = 'pdf-to-epub'
        from = 'PDF'
        to = 'EPUB'
        catSlug = 'document-converter'
        catName = 'Document Converter'
        title = 'Convert PDF to EPUB on Windows — Offline | File Converter Pro'
        desc = 'Convert PDF to EPUB ebook on Windows 10 and 11 offline. Reflowable ebook from fixed PDF layout. No upload, no watermark, no subscription. Try free.'
        h1 = 'Convert PDF to EPUB on Windows — Offline &amp; Reflowable'
        heroSubtitle = 'Convert fixed-layout PDFs to reflowable EPUB ebooks on Windows — offline, no upload, batch processing, free trial.'
        whyHtml = @'
                    <p>EPUB is the reflowable ebook format that adjusts text flow to any screen size — ideal for reading on e-readers, tablets, and phones. PDF is fixed-layout — it renders at one fixed page size regardless of screen. <strong>Converting PDF to EPUB gives you a version of the content that is comfortable to read on small screens</strong> without pinching and zooming through a fixed-layout PDF.</p>
                    <p>PDF-to-EPUB is useful when you have a text-heavy PDF document — a research paper, a company manual, a public-domain book in PDF — that you want to read comfortably on your Kindle, Kobo, or smartphone e-reader app. The EPUB reader reflows paragraphs to the screen width and lets you change font size, which a PDF cannot do.</p>
                    <p>The quality of PDF to EPUB conversion depends on the source PDF structure. Text-based PDFs with clear heading hierarchy and consistent paragraph structure convert to readable EPUB with good fidelity. Complex multi-column layouts, PDFs with heavy graphical design, and scanned-page PDFs require more post-conversion editing to produce well-structured ebook files.</p>
                    <p>All conversion runs offline on your Windows 10 or 11 PC. Research papers and private documents are never uploaded to any server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes PDF to EPUB conversion.' }
            @{ name = 'Add PDF files to the queue'; text = 'Drag PDF files into the app. Text-based PDFs convert with highest accuracy. Scanned PDFs require OCR to be enabled.' }
            @{ name = 'Select EPUB output settings'; text = 'Choose EPUB. Enable OCR for scanned PDFs. Set heading detection sensitivity for better chapter structure in the output.' }
            @{ name = 'Convert offline'; text = 'Click Convert. EPUB files are generated locally and saved to your output folder. Load in Calibre, an e-reader app, or transfer to a Kindle or Kobo.' }
        )
        batchHtml = @'
                    <p>Researchers converting academic PDF papers to EPUB for mobile reading, and publishers converting PDF archives to reflowable formats, benefit from batch processing.</p>
                    <ul>
                        <li>Convert a folder of PDF papers or reports to EPUB in one run.</li>
                        <li>OCR mode handles scanned academic papers automatically.</li>
                        <li>Output EPUBs retain source filenames with .epub extension.</li>
                        <li>Works offline — academic and confidential PDFs stay local.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>Text-based PDFs:</strong> high accuracy. Paragraphs, headings, lists, and basic tables convert to correct EPUB structure.</li>
                        <li><strong>Scanned PDFs:</strong> OCR required. Scan quality at 300 DPI gives much better EPUB text quality than 150 DPI scans.</li>
                        <li><strong>Heading detection:</strong> the converter detects heading levels from font size and style to structure chapters and sections in the EPUB.</li>
                        <li><strong>Images:</strong> images in the PDF are extracted and embedded in the EPUB at the available resolution.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Text runs together without paragraphs.</strong> The source PDF had inconsistent paragraph spacing. Enable "paragraph detection" in settings to improve structure detection.</li>
                        <li><strong>Columns merged into one flow.</strong> Multi-column PDF layouts are difficult to correctly split into columns for reflowable EPUB. Single-column PDFs convert most accurately.</li>
                        <li><strong>Scanned PDF produces garbled text.</strong> Scan quality is too low for accurate OCR. Re-scan at 300 DPI if possible, or use the image-mode output which places each PDF page as an image in the EPUB.</li>
                        <li><strong>Chapter structure missing.</strong> Increase heading detection sensitivity so the converter identifies section boundaries correctly.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/epub-to-pdf/'; label = 'Convert EPUB to PDF (fixed-layout from ebook)' }
            @{ href = '/en/convert/pdf-to-word/'; label = 'Convert PDF to Word (editable document)' }
            @{ href = '/en/convert/word-to-pdf/'; label = 'Convert Word to PDF (lock layout)' }
            @{ href = '/en/converters/document-converter/'; label = 'Browse all document conversions' }
        )
        faqs = @(
            @{ q = 'How accurate is PDF to EPUB conversion?'; a = 'For text-based PDFs with clean structure, conversion is good — paragraphs, headings, and basic formatting carry over. Complex multi-column PDFs and scanned pages require more post-conversion editing in Calibre or Sigil.' }
            @{ q = 'Can I convert a scanned PDF to EPUB?'; a = 'Yes, with OCR enabled. The converter reads the scanned page image and extracts text. Results depend on scan quality — 300 DPI scans produce significantly better EPUB text than 150 DPI.' }
            @{ q = 'Can I read the output EPUB on a Kindle?'; a = 'Kindle uses MOBI/AZW format, not EPUB. Use Calibre (free) to convert the output EPUB to MOBI for Kindle transfer. Kobo and most other e-readers read EPUB natively.' }
            @{ q = 'Is the conversion offline?'; a = 'Yes. File Converter Pro converts PDF to EPUB entirely on your Windows PC. Your documents are not uploaded to any server.' }
        )
        outputOptions = @(
            'EPUB 2 and EPUB 3 output'
            'OCR for scanned PDFs'
            'Heading and chapter detection'
            'Image extraction and embedding'
            'Batch folder processing'
            'No upload required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your PDFs to reflowable EPUB ebooks offline — OCR included, no upload, no watermark, free trial.'
    },

    @{
        slug = 'svg-to-pdf'
        from = 'SVG'
        to = 'PDF'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert SVG to PDF on Windows — Offline | File Converter Pro'
        desc = 'Convert SVG vector graphics to PDF on Windows 10 and 11 offline. High-fidelity vector rendering, batch processing. No upload, no watermark. Try free.'
        h1 = 'Convert SVG to PDF on Windows — Vector-Accurate Offline'
        heroSubtitle = 'Export SVG vector graphics to print-ready PDF on Windows — vector-accurate rendering, batch processing, fully offline, free trial.'
        whyHtml = @'
                    <p>SVG (Scalable Vector Graphics) is the web-native vector format — perfect for logos, icons, diagrams, and illustrations that scale to any size without quality loss. PDF is the print and distribution standard for vector artwork. <strong>Converting SVG to PDF preserves vector paths, shapes, and text at infinite resolution</strong> — the resulting PDF is print-ready at any DPI without pixel artefacts.</p>
                    <p>Designers export SVG icons and logos from Illustrator, Figma, or Inkscape for web use. When those same assets need to go to print — on business cards, posters, brochures, or packaging — they need to be in PDF format. Converting SVG to PDF is the clean path from digital-first asset to print-ready deliverable.</p>
                    <p>SVG to PDF is also useful for archiving diagrams from technical documentation (network diagrams, system architecture charts, UML diagrams often exported as SVG) into a format that is easier to distribute and display without requiring a browser. PDF viewers render the vector content correctly without needing SVG rendering support.</p>
                    <p>File Converter Pro converts SVG to PDF entirely offline on Windows 10 and 11. Your proprietary logo files and design assets never need to leave your local machine.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes SVG to PDF conversion.' }
            @{ name = 'Add SVG files to the queue'; text = 'Drag SVG files or a folder into the app. Both simple icon SVGs and complex illustration SVGs are handled.' }
            @{ name = 'Set PDF page settings'; text = 'Choose page size (A4, Letter, or fit-to-SVG-viewBox). Vector content scales perfectly to any page size. Set margins if needed.' }
            @{ name = 'Convert offline'; text = 'Click Convert. SVG content is rendered to PDF locally. Vector paths and shapes are preserved as scalable PDF vector objects.' }
        )
        batchHtml = @'
                    <p>Icon library exports, diagram archives, and brand asset collections that contain hundreds of SVG files can be batch-converted to PDF in one run.</p>
                    <ul>
                        <li>Convert entire SVG icon sets or diagram libraries to PDF in one queue run.</li>
                        <li>Vector fidelity preserved in every output PDF.</li>
                        <li>Consistent page size settings across the batch.</li>
                        <li>Works offline — proprietary brand assets stay local.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>Vector rendering:</strong> paths, shapes, bezier curves, and fills from the SVG are preserved as native PDF vector objects. The PDF scales to any print size without loss.</li>
                        <li><strong>Text rendering:</strong> SVG text is converted to PDF text objects where fonts are available, or outlined as paths where fonts are not embedded in the SVG.</li>
                        <li><strong>Fit-to-SVG-viewBox:</strong> the PDF page size matches the SVG viewBox dimensions, preserving the intended proportions exactly.</li>
                        <li><strong>A4/Letter output:</strong> SVG content is scaled to fill the specified page, with letterboxing applied to maintain aspect ratio.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Text looks wrong in PDF.</strong> The SVG used web fonts (Google Fonts, custom CSS fonts) that are not available at conversion time. Use outline text mode to convert text to vector paths, or ensure the fonts are installed on the Windows machine.</li>
                        <li><strong>SVG filters not rendering correctly.</strong> Complex CSS filter effects (blur, drop shadow) may not render identically in PDF. Rasterise these effects in your design tool before exporting SVG for PDF conversion.</li>
                        <li><strong>Colours look different from browser rendering.</strong> SVG colour profiles and ICC profiles may not carry over to PDF. Use sRGB colours in your SVG for consistent output.</li>
                        <li><strong>Blank PDF output.</strong> The SVG may be referencing external files (images, fonts) that are not present alongside the SVG. Ensure the SVG is self-contained.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/svg-to-png/'; label = 'Convert SVG to PNG (vector to raster)' }
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (raster images to PDF)' }
            @{ href = '/en/convert/jpg-to-pdf/'; label = 'Convert JPG to PDF (photos to PDF)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Does SVG to PDF conversion preserve vector quality?'; a = 'Yes. SVG vector paths, shapes, and fills are converted to native PDF vector objects. The resulting PDF is resolution-independent and print-ready at any DPI.' }
            @{ q = 'What happens to text in the SVG when converted to PDF?'; a = 'If the font used in the SVG is installed on your Windows machine, it is embedded in the PDF as text. If the font is not available, text is outlined as vector paths to preserve visual fidelity.' }
            @{ q = 'What page size should I use for SVG to PDF?'; a = '"Fit-to-SVG-viewBox" preserves the SVG''s exact dimensions. A4 or Letter scales the SVG to fill a standard page — best for print layouts. For icon exports, fit-to-viewBox is usually more appropriate.' }
            @{ q = 'Can I batch-convert an entire folder of SVG files to PDF?'; a = 'Yes. Drop the folder into File Converter Pro and all SVG files are converted to PDF in one batch run.' }
        )
        outputOptions = @(
            'Vector paths preserved in PDF'
            'A4 / Letter / fit-to-SVG page size'
            'Text as PDF text or outlined paths'
            'Batch folder processing'
            'No upload required'
            'Print-ready at any DPI'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your SVG vector graphics to print-ready PDF offline — vector-accurate, no upload, no watermark, free trial.'
    },

    @{
        slug = 'svg-to-png'
        from = 'SVG'
        to = 'PNG'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert SVG to PNG on Windows — Offline | File Converter Pro'
        desc = 'Convert SVG vector graphics to PNG on Windows 10 and 11 offline. Control output resolution and DPI. Batch icon libraries. No upload, no watermark. Try free.'
        h1 = 'Convert SVG to PNG on Windows — Any Resolution, Offline'
        heroSubtitle = 'Rasterise SVG vector graphics to high-resolution PNG on Windows — control DPI, batch icon sets, fully offline, free trial.'
        whyHtml = @'
                    <p>SVG is the web-native vector format but many contexts require raster PNG: email signatures, presentation slides, Word documents, and apps that do not support SVG images. <strong>Converting SVG to PNG rasterises the vector artwork at any resolution you choose</strong> — from 72 DPI for screen to 600 DPI for print, with pixel-perfect rendering of all vector paths and typography.</p>
                    <p>Developers building icon libraries export SVG icons from design tools and need PNG versions at multiple sizes for use in native mobile apps, Windows desktop apps, and email templates. Marketing teams receive SVG logos from design agencies and need PNG versions for web ads, banner graphics, and presentations that do not support inline SVG.</p>
                    <p>A key advantage of converting from vector is that you can generate PNG at any resolution from the same SVG source. Need a 24×24 favicon and a 512×512 app store icon from the same logo SVG? File Converter Pro renders both at exact pixel dimensions from the scalable vector source without any quality loss.</p>
                    <p>All conversion runs offline on Windows 10 and 11. Your brand assets and proprietary vector files never leave your local machine.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes SVG to PNG rasterisation.' }
            @{ name = 'Add SVG files to the queue'; text = 'Drag SVG files or a folder containing an icon library into the app.' }
            @{ name = 'Set output resolution'; text = 'Enter the output size in pixels (e.g., 512×512 for app icons, 1920×1080 for a background, or a specific DPI). SVG renders at exact vector quality regardless of output size.' }
            @{ name = 'Convert offline'; text = 'Click Convert. PNG files are generated locally at the resolution you specified. Vector paths are rendered with anti-aliasing for smooth edges.' }
        )
        batchHtml = @'
                    <p>Icon library exports and brand asset rasterisation often involve hundreds of SVG files that all need PNG versions at specific sizes. File Converter Pro handles these batches efficiently.</p>
                    <ul>
                        <li>Convert an entire SVG icon library to PNG in one queue run.</li>
                        <li>Set one output size for the batch, or configure per-file sizes.</li>
                        <li>Transparency (alpha channel) preserved in all output PNGs.</li>
                        <li>No upload — proprietary design files stay local.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>72 DPI (web/screen):</strong> standard for on-screen display and web export. Small file size.</li>
                        <li><strong>150 DPI:</strong> good for presentations and documents. Clear at 100% zoom on modern retina displays.</li>
                        <li><strong>300 DPI:</strong> print quality. Use for business cards, brochures, and any print output.</li>
                        <li><strong>Pixel-exact output:</strong> specify exact pixel dimensions (e.g., 512×512) rather than DPI for app icons and UI assets where exact pixel counts matter.</li>
                        <li><strong>Anti-aliasing:</strong> enabled by default for smooth curved edges. Disable for pixel-art icons that require hard edges.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Text missing or wrong font in PNG.</strong> The SVG uses a web font that is not installed on Windows. Install the font, use outlined text in the SVG, or switch to a system font before exporting.</li>
                        <li><strong>PNG has white background instead of transparency.</strong> Enable transparent background (PNG-24 with alpha) in the output settings. The SVG background may be explicitly white — check the SVG file if transparency is not appearing.</li>
                        <li><strong>PNG looks pixelated at expected size.</strong> Increase the output resolution. At very small sizes (16×16) even SVG rasterisation will show pixelation for complex icons — use a simplified icon design for tiny sizes.</li>
                        <li><strong>SVG filters not rendering.</strong> Complex CSS filter effects may not render correctly. Flatten these effects in Illustrator or Inkscape before exporting SVG for PNG conversion.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/svg-to-pdf/'; label = 'Convert SVG to PDF (vector to print document)' }
            @{ href = '/en/convert/png-to-ico/'; label = 'Convert PNG to ICO (create Windows icon)' }
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (reduce raster file size)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'At what resolution should I export SVG to PNG?'; a = '72 DPI for web and screen. 150 DPI for presentations. 300 DPI for print. Or specify exact pixel dimensions (e.g., 512×512) for app icons — the SVG scales to any size with perfect quality.' }
            @{ q = 'Does SVG to PNG preserve transparency?'; a = 'Yes. SVG transparent areas are converted to PNG alpha channel transparency. Use PNG-24 output (not PNG-8) for full alpha support.' }
            @{ q = 'Can I generate multiple PNG sizes from one SVG?'; a = 'Yes. Add the same SVG multiple times with different output resolutions, or run separate batch conversions for each target size.' }
            @{ q = 'Can I batch-convert an entire SVG icon library to PNG?'; a = 'Yes. Drop the folder into File Converter Pro and every SVG is rasterised to PNG at the resolution you specify. Filenames are preserved with .png extension.' }
        )
        outputOptions = @(
            'Pixel-exact output size'
            '72 / 96 / 150 / 300 DPI'
            'PNG-24 with alpha transparency'
            'Anti-aliasing on/off'
            'Batch folder processing'
            'No upload required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and rasterise your SVG files to high-resolution PNG offline — any DPI, transparency preserved, no upload, no watermark, free trial.'
    }
)
