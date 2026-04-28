# Per-category data for generate_category_pages_v2.ps1

$CategoryData = @(
    @{
        slug = 'pdf-converter'
        name = 'PDF Converter'
        title = 'PDF Converter for Windows — Offline & Batch | File Converter Pro'
        desc = 'PDF converter for Windows — turn DOCX, PPTX, HTML, Markdown, TXT and images into PDFs offline. Convert from PDF to Word, Excel, JPG. Free trial.'
        h1 = 'PDF Converter for Windows 10 &amp; 11 — Offline &amp; Batch'
        heroSubtitle = 'Convert documents, slides, web pages, Markdown notes and images to PDF — and pull PDFs back to Word, Excel, PowerPoint, JPG. All locally, no upload, no watermark, no size cap.'
        introHtml = @'
                    <p>PDF is the universal format for stable, locked, cross-device-readable documents. The catch is most cloud PDF tools either watermark the output, cap free use at a few tasks per day, or upload your contracts and invoices to a third-party server. File Converter Pro is the desktop alternative: a Windows 10 / 11 native app that handles every common PDF input and output, fully offline.</p>
                    <p>The same engine creates PDFs from DOCX, PPTX, HTML, Markdown, TXT and image files; pulls editable Word, Excel and PowerPoint back from PDFs; rasterizes pages to JPG or PNG; and runs the whole pipeline in batch with no per-file ceremony.</p>
'@
        formatsHtml = @'
                    <p>File Converter Pro converts to and from the most-used PDF-adjacent formats:</p>
                    <ul>
                        <li><strong>To PDF:</strong> DOCX, PPTX, HTML, Markdown, TXT, JPG, PNG, TIFF, HEIC.</li>
                        <li><strong>From PDF:</strong> DOCX (Word), XLSX (Excel), PPTX (PowerPoint), JPG, PNG, EPUB.</li>
                        <li><strong>PDF utilities:</strong> page extraction, image rasterization, batch merge, password-protect output.</li>
                        <li><strong>PDF/A archival:</strong> embed all fonts, ICC color profile, long-term-readable metadata.</li>
                    </ul>
'@
        cards = @(
            @{ href='/en/convert/docx-to-pdf/'; from='DOCX'; to='PDF'; blurb='Stable document sharing without losing fonts or layout. Batch from a folder of contracts.' }
            @{ href='/en/convert/pptx-to-pdf/'; from='PPTX'; to='PDF'; blurb='Send slides without forcing PowerPoint installs. Optional handout layout.' }
            @{ href='/en/convert/txt-to-pdf/'; from='TXT'; to='PDF'; blurb='Plain text logs and READMEs into printable, archivable PDFs with monospace fonts.' }
            @{ href='/en/convert/markdown-to-pdf/'; from='Markdown'; to='PDF'; blurb='Docs-as-code shipping — release notes and design docs to a polished PDF.' }
            @{ href='/en/convert/html-to-pdf/'; from='HTML'; to='PDF'; blurb='Offline snapshots and reports — capture full CSS rendering and page breaks.' }
            @{ href='/en/convert/pdf-to-word/'; from='PDF'; to='Word'; blurb='Pull editable DOCX from PDF reports and contracts.' }
            @{ href='/en/convert/pdf-to-jpg/'; from='PDF'; to='JPG'; blurb='Rasterize pages to JPG thumbnails for previews and galleries.' }
            @{ href='/en/convert/pdf-to-excel/'; from='PDF'; to='Excel'; blurb='Pull tables out of PDFs into XLSX for analysis.' }
            @{ href='/en/convert/image-to-pdf/'; from='Image'; to='PDF'; blurb='Stitch JPG, PNG and HEIC photos into a single PDF document.' }
        )
        whyHtml = @'
                    <ul>
                        <li><strong>Stays offline.</strong> Contracts, invoices, NDAs, internal decks — never uploaded to a third-party server.</li>
                        <li><strong>No file-count limit.</strong> Convert thousands of DOCX or PDF files in a single queue.</li>
                        <li><strong>No size cap.</strong> 500 MB scanned PDFs, 200-slide decks, image-heavy reports — all handled.</li>
                        <li><strong>No watermark.</strong> Outputs are clean, even on the free trial.</li>
                        <li><strong>One-time €6.49.</strong> No subscription, no monthly task limit.</li>
                        <li><strong>PDF/A and password support.</strong> Long-term archival mode and AES-256 encryption.</li>
                    </ul>
'@
        workflowsHtml = @'
                    <p><strong>Legal and HR teams</strong> push DOCX contracts and HR templates to PDF with embedded fonts and password protection. The batch queue handles a yearly archive of agreements in one run.</p>
                    <p><strong>Educators and trainers</strong> convert PowerPoint decks to PDF handouts (4-up or 6-up layouts) for distribution. Speaker notes can be included or stripped.</p>
                    <p><strong>Developers and writers</strong> ship release notes and product specs as PDF — Markdown source goes in, polished PDF with code highlighting comes out, all locally on the laptop.</p>
                    <p><strong>Accountants and analysts</strong> pull tables out of vendor PDFs into Excel for reconciliation, and re-export the result as a fresh PDF report.</p>
'@
        faqs = @(
            @{ q = 'Does the PDF converter work fully offline on Windows?'; a = 'Yes. Every conversion to or from PDF runs locally on your Windows 10 or 11 PC. No file is uploaded, no cloud account is required, and no telemetry is sent on file contents.' }
            @{ q = 'Can it preserve formatting, fonts and tables?'; a = 'Yes. The DOCX/PPTX → PDF path embeds fonts, preserves layout, and supports PDF/A archival mode. The reverse PDF → Word/Excel path uses structured extraction to keep tables and headings intact when the source PDF has selectable text.' }
            @{ q = 'Does it handle password-protected PDFs?'; a = 'Yes for output: you can set an open-password and an editing-password using AES-256 encryption. For input: the app prompts for the password when reading an encrypted PDF.' }
            @{ q = 'How does this compare to iLovePDF, Smallpdf or CloudConvert?'; a = 'Those are cloud services — they require upload, watermark some outputs, cap free use, and depend on a network. File Converter Pro is a desktop app: nothing leaves your computer, no caps, no watermark, €6.49 one-time.' }
        )
        sidebarFormats = 'DOCX · PPTX · HTML · Markdown · TXT · JPG · PNG · TIFF · HEIC · PDF · XLSX · EPUB'
        closingPara = 'Install File Converter Pro from the Microsoft Store and run your full PDF pipeline locally — no upload, no watermark, no cap.'
    },

    @{
        slug = 'document-converter'
        name = 'Document Converter'
        title = 'Document Converter for Windows — Offline | File Converter Pro'
        desc = 'Document converter for Windows — convert DOCX, HTML, Markdown, RTF, TXT and PDF offline in batch. Docs-as-code workflows. No upload. Free trial.'
        h1 = 'Document Converter for Windows 10 &amp; 11 — Offline &amp; Batch'
        heroSubtitle = 'Convert between DOCX, HTML, Markdown, RTF, TXT and PDF for docs-as-code, web publishing, note-taking app migration and legacy importers — locally, with no upload.'
        introHtml = @'
                    <p>Document conversion is rarely a one-shot thing — it&rsquo;s usually part of a workflow: a Word doc going into a CMS, a Markdown source going to a client as PDF, an HTML export migrating into Obsidian, a SharePoint dump being normalized to plain text. The pain with cloud tools is consistency: each web converter handles tables, code blocks and embedded images differently, and the result needs cleanup.</p>
                    <p>File Converter Pro runs every conversion through one engine on your Windows PC, so the output is consistent across formats and predictable across batches. No upload, no daily quota, and no proprietary lock-in.</p>
'@
        formatsHtml = @'
                    <p>The document converter category covers the bidirectional matrix of:</p>
                    <ul>
                        <li><strong>DOCX</strong> — Microsoft Word, the universal office format.</li>
                        <li><strong>HTML</strong> — web markup for blogs, intranets, static sites.</li>
                        <li><strong>Markdown</strong> — docs-as-code; works with MkDocs, Docusaurus, Hugo, GitHub.</li>
                        <li><strong>RTF</strong> — legacy rich-text format still used by older importers.</li>
                        <li><strong>TXT</strong> — plain text for log analyzers, scripts, ML training prep.</li>
                        <li><strong>PDF</strong> — terminal output for stable, sharable documents.</li>
                    </ul>
'@
        cards = @(
            @{ href='/en/convert/docx-to-pdf/'; from='DOCX'; to='PDF'; blurb='Stable document sharing — preserve fonts, layout, headers and footers.' }
            @{ href='/en/convert/docx-to-html/'; from='DOCX'; to='HTML'; blurb='Web publishing workflow — clean, CSS-friendly HTML out of Word.' }
            @{ href='/en/convert/docx-to-markdown/'; from='DOCX'; to='Markdown'; blurb='Docs-as-code migration into Git-tracked Markdown sources.' }
            @{ href='/en/convert/html-to-markdown/'; from='HTML'; to='Markdown'; blurb='Move HTML pages into note-taking apps or static-site sources.' }
            @{ href='/en/convert/html-to-pdf/'; from='HTML'; to='PDF'; blurb='Offline snapshots — capture full CSS rendering and page breaks.' }
            @{ href='/en/convert/markdown-to-pdf/'; from='Markdown'; to='PDF'; blurb='Polished PDFs from Markdown — code highlighting, tables, headings.' }
            @{ href='/en/convert/rtf-to-txt/'; from='RTF'; to='TXT'; blurb='Strip rich-text formatting for plain-text pipelines.' }
            @{ href='/en/convert/txt-to-pdf/'; from='TXT'; to='PDF'; blurb='Plain text logs and READMEs into printable PDFs.' }
        )
        whyHtml = @'
                    <ul>
                        <li><strong>Consistent output.</strong> One engine across DOCX, HTML, Markdown, RTF and TXT — predictable handling of tables, code, lists.</li>
                        <li><strong>Offline guarantee.</strong> Confidential drafts and NDA-protected work never leave your computer.</li>
                        <li><strong>Batch by default.</strong> Run a whole SharePoint or GitHub Wiki export in a single queue.</li>
                        <li><strong>Smart-quotes and Unicode.</strong> Curly quotes, em-dashes and non-Latin scripts survive every conversion.</li>
                        <li><strong>Image extraction.</strong> Word images come out into a folder with proper filenames, ready for static-site assets.</li>
                    </ul>
'@
        workflowsHtml = @'
                    <p><strong>Technical writers</strong> migrate Word documents into Markdown for MkDocs or Docusaurus — the converter extracts images into a separate folder and rewrites the references for clean Git diffs.</p>
                    <p><strong>Marketing teams</strong> push Word drafts to clean HTML for the company blog without manual cleanup of Word&rsquo;s bloated markup.</p>
                    <p><strong>Note-takers</strong> migrate Evernote / Notion HTML exports into Obsidian or Bear by converting HTML to Markdown in one batch — folder structure preserved.</p>
                    <p><strong>Engineers</strong> ship Markdown release notes to clients as branded PDFs without spinning up a build pipeline.</p>
'@
        faqs = @(
            @{ q = 'Does document conversion preserve tables and code blocks?'; a = 'Yes. The DOCX → Markdown / HTML path keeps tables as actual tables (not images), preserves heading hierarchy, and detects code-block formatting. The reverse path round-trips back without formatting loss for typical content.' }
            @{ q = 'Can I batch-convert a whole SharePoint or Google Drive export?'; a = 'Yes. Drop the export folder into the queue. The app processes thousands of documents locally on your Windows PC, with mirrored folder structure on the output side.' }
            @{ q = 'Will Markdown flavor (CommonMark vs GitHub-flavored) be respected?'; a = 'Yes. You pick the flavor in the output panel — CommonMark for strict portability, GFM (GitHub-flavored) for tables, task lists and fenced code blocks.' }
            @{ q = 'How does this compare to Pandoc?'; a = 'Same conversion quality, dramatically simpler. Pandoc is a CLI; this is a drag-and-drop Windows app with a queue, settings UI, batch progress, and built-in image extraction.' }
        )
        sidebarFormats = 'DOCX · HTML · Markdown · RTF · TXT · PDF'
        closingPara = 'Install File Converter Pro from the Microsoft Store and run your whole document pipeline through one consistent engine — locally, with no upload.'
    },

    @{
        slug = 'data-converter'
        name = 'Data Converter'
        title = 'Data Converter for Windows — XLSX, CSV, JSON | File Converter Pro'
        desc = 'Data converter for Windows — convert XLSX, CSV and JSON files offline in batch. ETL, BI imports, API mocks, ML training prep. No upload. Free trial.'
        h1 = 'Data Converter for Windows 10 &amp; 11 — XLSX · CSV · JSON'
        heroSubtitle = 'Convert spreadsheets to flat files and back — XLSX ↔ CSV ↔ JSON for ETL pipelines, BI imports, API mocks, frontend fixtures and ML training prep. All offline.'
        introHtml = @'
                    <p>Data conversion lives at the boundary between humans and systems. Stakeholders work in Excel; databases want CSV; web apps want JSON. Cloud converters are awkward here — your customer list, financial export or audit log doesn&rsquo;t belong on a third-party server.</p>
                    <p>File Converter Pro handles XLSX ↔ CSV ↔ JSON locally on Windows with full control over delimiters, encoding, type inference, and JSON shape. The queue happily processes a folder of monthly exports in one run.</p>
'@
        formatsHtml = @'
                    <ul>
                        <li><strong>XLSX</strong> — Microsoft Excel workbooks (multiple sheets, formatting, formulas).</li>
                        <li><strong>XLS</strong> — legacy Excel binary format.</li>
                        <li><strong>CSV</strong> — comma-, semicolon- or tab-separated value files.</li>
                        <li><strong>JSON</strong> — array-of-objects, records, or nested structures.</li>
                    </ul>
                    <p>Encoding options cover UTF-8 (with or without BOM), UTF-16, and ANSI for legacy importers. Delimiter detection is automatic on read; you control it explicitly on write.</p>
'@
        cards = @(
            @{ href='/en/convert/xlsx-to-csv/'; from='XLSX'; to='CSV'; blurb='Feed databases, BI tools and ETL pipelines that don&rsquo;t read XLSX directly.' }
            @{ href='/en/convert/csv-to-json/'; from='CSV'; to='JSON'; blurb='Spreadsheet rows into JSON for API mocks, frontend fixtures and JS apps.' }
            @{ href='/en/convert/json-to-xlsx/'; from='JSON'; to='XLSX'; blurb='Turn API responses and audit logs into spreadsheets stakeholders can pivot.' }
        )
        whyHtml = @'
                    <ul>
                        <li><strong>Stays offline.</strong> Customer data, financial exports and audit logs never leave your computer.</li>
                        <li><strong>Batch by default.</strong> Convert a folder of monthly exports in one run.</li>
                        <li><strong>Encoding control.</strong> UTF-8, UTF-8 BOM, UTF-16, ANSI — for legacy importers and modern systems alike.</li>
                        <li><strong>Type-aware JSON.</strong> Numbers, booleans and dates can be inferred or kept as strings — your pick.</li>
                        <li><strong>Sheet selection.</strong> Export the active sheet, named sheets, or every sheet to separate files.</li>
                        <li><strong>Formula handling.</strong> Keep formulas as values or preserve the formula string on round-trip.</li>
                    </ul>
'@
        workflowsHtml = @'
                    <p><strong>Data engineers</strong> turn quarterly XLSX exports into UTF-8 CSV ready for warehouse ingestion. The encoding-with-BOM toggle handles older importers; without-BOM is the cloud default.</p>
                    <p><strong>Frontend developers</strong> build mock APIs by converting CSV product catalogs into JSON fixtures — array-of-objects shape, typed values, ready to drop into a React app.</p>
                    <p><strong>Analysts</strong> flatten JSON API dumps into XLSX so business stakeholders can filter, pivot and chart without touching a JSON viewer.</p>
                    <p><strong>ML engineers</strong> preprocess training data by converting between formats with consistent encoding and delimiter handling — no surprise UTF-16 or Windows-1252 quirks downstream.</p>
                    <p>Most data-conversion bugs are about the small details: a CSV that opens fine in one editor and looks corrupted in another, a JSON file that imports as strings instead of numbers, a multi-sheet XLSX flattened into one CSV with no separator. File Converter Pro applies sensible defaults for each format pair while exposing every knob in the output panel — encoding (UTF-8, UTF-8 BOM, UTF-16, ANSI), delimiter (comma, semicolon, tab, pipe), quote style, line ending (CRLF / LF), date format (ISO 8601 by default, locale-specific on request), and decimal separator. The same controls apply to every file in a batch, so the output is consistent across hundreds of conversions.</p>
'@
        faqs = @(
            @{ q = 'How does the converter handle nested JSON?'; a = 'You choose: flatten dot-paths into columns (object.field becomes its own column), explode arrays into one row per item, or keep nested structures as JSON-string cells. The default is dot-path flattening for stakeholders, explode for analytics.' }
            @{ q = 'Can I export a multi-sheet XLSX as multiple CSV files?'; a = 'Yes. Pick &ldquo;every sheet to separate file&rdquo; in the output panel and the app emits one CSV per sheet, named after the sheet.' }
            @{ q = 'Will my CSV encoding be preserved correctly?'; a = 'Yes. The app reads any common encoding automatically (UTF-8, UTF-16, ANSI), and writes to the encoding you pick. Use UTF-8 for modern systems; UTF-8 BOM for older Excel; ANSI only for legacy importers that demand it.' }
            @{ q = 'Is data conversion offline?'; a = 'Yes. Conversion runs locally on your Windows PC. Customer rosters, financial data, and audit JSON never go to a cloud service.' }
        )
        sidebarFormats = 'XLSX · XLS · CSV · JSON'
        closingPara = 'Install File Converter Pro from the Microsoft Store and run your data pipeline locally with full control over encoding, delimiter and JSON shape.'
    },

    @{
        slug = 'video-converter'
        name = 'Video Converter'
        title = 'Video Converter for Windows — Offline & Batch | File Converter Pro'
        desc = 'Video converter for Windows — convert MP4, MKV, MOV, WebM, AVI, WMV offline. Batch encode for iOS, Android, web and social uploads. Free trial.'
        h1 = 'Video Converter for Windows 10 &amp; 11 — Offline &amp; Batch'
        heroSubtitle = 'Convert MP4, MKV, MOV, WebM, AVI and WMV — for iOS, smart-TVs, Slack uploads, browser-native delivery and archive. Native Windows encoder, no upload, no quota.'
        introHtml = @'
                    <p>Video conversion is the format the cloud is worst at. Master files run gigabytes; web converters cap free uploads at a few hundred MB; encode time on a shared server is unpredictable; and confidential footage doesn&rsquo;t belong on someone else&rsquo;s machine. File Converter Pro runs the encoder locally with FFmpeg-class quality on your own CPU.</p>
                    <p>The same engine handles MP4 ↔ MKV ↔ MOV ↔ WebM ↔ AVI ↔ WMV — remuxing where possible (lossless, instant) or re-encoding to H.264, H.265 or AV1 with full control over bitrate, CRF, audio codec and subtitle handling.</p>
'@
        formatsHtml = @'
                    <ul>
                        <li><strong>MP4</strong> — universal cross-device container.</li>
                        <li><strong>MKV</strong> — best for archival; multi-track audio, soft subtitles, chapters.</li>
                        <li><strong>MOV</strong> — Apple QuickTime; iPhone and Mac default.</li>
                        <li><strong>WebM</strong> — VP9 / AV1 + Opus, browser-native delivery.</li>
                        <li><strong>AVI / WMV</strong> — legacy formats kept for older players.</li>
                    </ul>
                    <p>Codec coverage: H.264, H.265 (HEVC), AV1, VP9, MPEG-4 ASP. Audio: AAC, MP3, Opus, AC-3, passthrough.</p>
'@
        cards = @(
            @{ href='/en/convert/mkv-to-mp4/'; from='MKV'; to='MP4'; blurb='Universal compatibility — iOS, smart-TVs, social uploads.' }
            @{ href='/en/convert/mov-to-mp4/'; from='MOV'; to='MP4'; blurb='iPhone footage to universal MP4 for Slack, Android and YouTube.' }
            @{ href='/en/convert/mp4-to-webm/'; from='MP4'; to='WebM'; blurb='Browser-native delivery with VP9 / AV1 + Opus, smaller files.' }
            @{ href='/en/convert/webm-to-mp4/'; from='WebM'; to='MP4'; blurb='Save downloaded WebM clips as MP4 for editors and TV playback.' }
            @{ href='/en/convert/mp4-to-gif/'; from='MP4'; to='GIF'; blurb='Quick clips for Slack, Discord and chat — palette-optimized GIFs.' }
        )
        whyHtml = @'
                    <ul>
                        <li><strong>Stays offline.</strong> Multi-gigabyte master files never leave your computer.</li>
                        <li><strong>No size cap.</strong> Convert 4 GB Blu-ray rips, 8K drone footage, hours of screen recording.</li>
                        <li><strong>No watermark.</strong> Outputs are clean, even on the free trial.</li>
                        <li><strong>Hardware acceleration.</strong> Use Intel QSV, NVIDIA NVENC or AMD AMF for fast encodes when available.</li>
                        <li><strong>Subtitle handling.</strong> Keep soft subtitle tracks or burn them into the video.</li>
                        <li><strong>Multi-track audio.</strong> Carry multiple audio languages or downmix to stereo.</li>
                    </ul>
'@
        workflowsHtml = @'
                    <p><strong>Content creators</strong> remux MKV recordings to MP4 for upload to YouTube, Vimeo and TikTok — instant, lossless, no re-encode time.</p>
                    <p><strong>Web teams</strong> generate WebM versions of hero loops and demo videos for browser-native HTML5 playback. Two-pass VP9 produces 30 % smaller files at the same visual quality.</p>
                    <p><strong>iPhone users</strong> convert .MOV exports to MP4 for sharing on Android, Slack and Microsoft Teams without compatibility surprises.</p>
                    <p><strong>Educators</strong> trim and re-encode lecture recordings for LMS upload — bitrate caps, resolution presets and chapter markers all handled.</p>
'@
        faqs = @(
            @{ q = 'Will video conversion lose quality?'; a = 'Only if you re-encode. Many conversions are remuxes — the streams are repackaged into a new container with no quality loss and no encode time. Re-encoding to a different codec (H.265, AV1) does drop a small amount of detail at sensible CRF settings.' }
            @{ q = 'Does it support hardware acceleration?'; a = 'Yes when your hardware supports it — Intel Quick Sync Video, NVIDIA NVENC and AMD AMF for H.264 and HEVC encoding. Encode times drop 5-15× compared to software encoding.' }
            @{ q = 'Can I keep multiple audio tracks and subtitles?'; a = 'Yes. The output panel lists every track in the source — pick which audio languages and subtitle layers carry to the output. Soft subtitles stay selectable in players; hard subtitles are burned in.' }
            @{ q = 'Is video conversion offline?'; a = 'Yes. Encoding runs on your Windows PC. Confidential footage and multi-gigabyte master files never go to a cloud service.' }
        )
        sidebarFormats = 'MP4 · MKV · MOV · WebM · AVI · WMV'
        closingPara = 'Install File Converter Pro from the Microsoft Store and run your video pipeline locally with FFmpeg-class control — no upload, no quota, no watermark.'
    },

    @{
        slug = 'audio-converter'
        name = 'Audio Converter'
        title = 'Audio Converter for Windows — Offline & Batch | File Converter Pro'
        desc = 'Audio converter for Windows — convert MP3, WAV, FLAC, AAC, OGG offline. Batch encode music libraries and podcasts. Full ID3 tag support. Free trial.'
        h1 = 'Audio Converter for Windows 10 &amp; 11 — Offline &amp; Batch'
        heroSubtitle = 'Convert MP3, WAV, FLAC, AAC, OGG and M4A — for music libraries, podcasts, voice notes and distribution. Native Windows encoder, full ID3 / cover-art support, no upload.'
        introHtml = @'
                    <p>Audio is the workflow where bulk matters most. A music library is thousands of tracks; a podcast season is dozens of files; a voice-note backup is hundreds of clips. Cloud converters charge per minute or cap free use, and re-encoding lossless audio in a browser uploader is painful.</p>
                    <p>File Converter Pro runs the LAME, FLAC and Opus encoders locally on Windows with full ID3 / cover-art / ReplayGain support. The queue handles 5,000-track libraries in a single batch, on your CPU, with no upload.</p>
'@
        formatsHtml = @'
                    <ul>
                        <li><strong>MP3</strong> — universal lossy format with full ID3v2 metadata support.</li>
                        <li><strong>WAV</strong> — uncompressed PCM for studio recording and editing.</li>
                        <li><strong>FLAC</strong> — lossless compression, half the size of WAV with bit-perfect quality.</li>
                        <li><strong>AAC / M4A</strong> — Apple-favored lossy codec, slightly cleaner than MP3 at the same bitrate.</li>
                        <li><strong>OGG</strong> — Vorbis codec, royalty-free, common in games and Linux ecosystems.</li>
                    </ul>
'@
        cards = @(
            @{ href='/en/convert/wav-to-mp3/'; from='WAV'; to='MP3'; blurb='Studio recordings to small distribution files for podcasts and music.' }
            @{ href='/en/convert/flac-to-mp3/'; from='FLAC'; to='MP3'; blurb='Shrink lossless music to phone-ready files at 5-10× smaller size.' }
            @{ href='/en/convert/aac-to-mp3/'; from='AAC'; to='MP3'; blurb='Older car stereos and MP3 players need MP3, not AAC. Re-encode at 256 kbps.' }
            @{ href='/en/convert/m4a-to-mp3/'; from='M4A'; to='MP3'; blurb='iTunes downloads and voice memos to universal MP3.' }
            @{ href='/en/convert/ogg-to-mp3/'; from='OGG'; to='MP3'; blurb='Vorbis OGG to broad-compatibility MP3 for legacy players.' }
            @{ href='/en/convert/mp3-to-wav/'; from='MP3'; to='WAV'; blurb='Decompress MP3s to PCM for editing in DAWs and audio software.' }
        )
        whyHtml = @'
                    <ul>
                        <li><strong>Stays offline.</strong> Studio masters, unreleased songs and confidential recordings never upload anywhere.</li>
                        <li><strong>No file-count limit.</strong> Encode a 5,000-track library in one queue.</li>
                        <li><strong>Full tag support.</strong> ID3v2.3 / 2.4, Vorbis comments, MP4 atoms — read and written across formats.</li>
                        <li><strong>Cover art preserved.</strong> JPG / PNG embedded art carries between formats automatically.</li>
                        <li><strong>ReplayGain.</strong> Apply consistent loudness across the library in the same encoding pass.</li>
                        <li><strong>Multi-core encoding.</strong> Modern laptops process a 12-track album in seconds.</li>
                    </ul>
'@
        workflowsHtml = @'
                    <p><strong>Podcasters</strong> encode a season&rsquo;s worth of WAV recordings to MP3 at 96-128 kbps with consistent ID3 tags and cover art template — ready for RSS distribution.</p>
                    <p><strong>Music collectors</strong> convert FLAC libraries to V0 VBR MP3 for phone sync — folder structure mirrored, ReplayGain applied, ~80 % smaller files.</p>
                    <p><strong>Audiobook fans</strong> transcode AAC / M4A purchases to MP3 for older car stereos and MP3 players, with chapter splitting where supported.</p>
                    <p><strong>Game and indie developers</strong> convert OGG Vorbis to WAV for editing in DAWs, then re-encode to the engine&rsquo;s preferred format for shipping.</p>
'@
        faqs = @(
            @{ q = 'What MP3 bitrate is the right default?'; a = 'V0 VBR (averages ~245 kbps) is the smartest setting — audibly transparent on quality headphones while keeping files small. 256 kbps CBR is the predictable-size alternative; 320 kbps CBR is archival-grade.' }
            @{ q = 'Will tags and cover art transfer between formats?'; a = 'Yes. The app maps ID3v2 (MP3), Vorbis comments (FLAC, OGG), and MP4 atoms (M4A, AAC) automatically. Embedded JPG / PNG cover art carries across without re-encoding the image.' }
            @{ q = 'Can I batch-convert a 5,000-track music library?'; a = 'Yes. Drop your library root folder and the app processes every track in one queue — multi-core encoding, mirrored folder structure on output, skip-existing-siblings for incremental re-encodes.' }
            @{ q = 'Is audio conversion offline?'; a = 'Yes. Encoding runs locally on your Windows PC using LAME, FLAC and Opus encoders. Music libraries, podcast masters and voice memos never leave your computer.' }
        )
        sidebarFormats = 'MP3 · WAV · FLAC · AAC · M4A · OGG'
        closingPara = 'Install File Converter Pro from the Microsoft Store and convert your audio library locally — full encoder control, full tag support, no upload.'
    }
)
