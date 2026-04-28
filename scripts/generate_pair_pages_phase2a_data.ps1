# Phase 2a data: image format pairs
# heic-to-jpg, heic-to-png, heic-to-pdf, avif-to-jpg, avif-to-png,
# jfif-to-jpg, tiff-to-pdf, webp-to-png, jpg-to-webp, png-to-webp, png-to-ico

$PairData = @(

    @{
        slug = 'heic-to-jpg'
        from = 'HEIC'
        to = 'JPG'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert HEIC to JPG on Windows — Offline | File Converter Pro'
        desc = 'Convert HEIC to JPG on Windows 10 and 11 fully offline. Batch-convert iPhone photos with no upload, no size limit, no watermark. Free trial available.'
        h1 = 'Convert HEIC to JPG on Windows — Offline &amp; Batch'
        heroSubtitle = 'Turn iPhone and iPad HEIC photos into universally compatible JPGs on your Windows PC — no cloud upload, no size cap, free trial included.'
        whyHtml = @'
                    <p>HEIC (High Efficiency Image Container) is the default photo format on iPhones running iOS 11 and later. It stores images in roughly <strong>half the file size of JPEG at the same visual quality</strong> thanks to the HEIF compression standard. Apple devices read HEIC natively, but almost everything else — Windows Explorer thumbnails, legacy photo editors, social media upload forms, email attachments — expects JPEG.</p>
                    <p>Converting HEIC to JPG lets you send photos that open anywhere: email them to relatives, upload to Facebook or Instagram without format errors, edit in Photoshop CS versions that predate HEIF support, or attach to a Word document. The resulting JPG retains full resolution and color data at the quality level you specify.</p>
                    <p>File Converter Pro handles HEIC → JPG entirely on your Windows 10 or 11 machine. There is no upload step, so your personal vacation and family photos never leave your computer. The batch queue processes a full Camera Roll folder in one click — hundreds of photos at once, each converted to a proper JPG with the original filename intact.</p>
                    <p>HEIC files can also store HDR tone-mapping data, depth maps, and Live Photo sequences. File Converter Pro extracts the primary still image from each HEIC and writes a standard JPG, correctly handling the color space so photos look right on any screen without the pink or washed-out tints that some online converters produce.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial lets you convert HEIC photos to JPG at full resolution before you decide to purchase for €6.49 once.' }
            @{ name = 'Drag your HEIC files or folder'; text = 'Open the app and drag a single photo, a multi-select, or the entire DCIM folder from your iPhone. Mixed HEIC and JPG files in the same folder are handled gracefully.' }
            @{ name = 'Select JPG as output and set quality'; text = 'Pick JPG in the output panel. Slide the quality to 85-95 for near-lossless results. You can also choose to preserve EXIF metadata — date, location, camera settings — in the output file.' }
            @{ name = 'Convert and collect your JPGs'; text = 'Click Convert. All processing is local — no upload. Output JPGs land in the folder you specify, with the same filenames as the originals (HEIC extension replaced by .jpg).' }
        )
        batchHtml = @'
                    <p>iPhones shoot HEIC by default, so transferring a year of photos to Windows typically means hundreds of HEIC files. File Converter Pro was built for exactly this scenario: drop the entire folder from File Explorer or from your iPhone when it mounts as a drive, and every HEIC in it — including subfolders — is added to the queue in seconds.</p>
                    <ul>
                        <li>No per-file size cap — 48 MP ProRAW-derived HEICs convert just as smoothly as 12 MP standard shots.</li>
                        <li>Preserve or strip EXIF data in bulk — useful for privacy-first sharing when you want to remove GPS coordinates.</li>
                        <li>Output to a separate folder to keep originals untouched alongside new JPGs.</li>
                        <li>The queue continues even if a corrupt file is encountered — it logs the failure and moves on.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>JPG quality is a lossy trade-off between file size and visual fidelity. For sharing and social media, <strong>quality 85</strong> gives excellent results at roughly half the file size of quality 100. For print or archiving, use quality 92-95. The slider in File Converter Pro shows a live estimate of the output file size so you can pick the sweet spot before running the batch.</p>
                    <ul>
                        <li><strong>Quality 95:</strong> near-lossless, recommended for archiving and print. ~80 % of the original HEIC file size.</li>
                        <li><strong>Quality 85:</strong> best-balance default for sharing. Around 40-50 % of the source size, visually indistinguishable at normal viewing.</li>
                        <li><strong>Quality 70:</strong> web thumbnails and previews. Noticeable compression on close inspection but fine at standard screen sizes.</li>
                        <li><strong>EXIF retention:</strong> date/time, GPS, camera model, and lens info are carried over by default. Disable per batch if you prefer.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Pink or yellow colour shift in output JPG.</strong> The HEIC was in a wide-gamut Display P3 colour space. File Converter Pro converts colours to sRGB for universal compatibility — if you see a shift, enable the &ldquo;convert to sRGB&rdquo; option explicitly.</li>
                        <li><strong>Thumbnails missing in Windows Explorer.</strong> Windows does not preview HEIC natively without the HEIF Image Extensions codec. The converted JPGs will have thumbnails immediately.</li>
                        <li><strong>EXIF date wrong in output.</strong> Some iPhones embed date in both EXIF and XMP. File Converter Pro copies EXIF DateTimeOriginal — check that your photo viewer reads EXIF, not XMP modification date.</li>
                        <li><strong>Live Photo gives only one frame.</strong> A Live Photo HEIC stores the still plus a short video. The converter extracts the primary still JPG; the video component is not exported as part of the image conversion.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/heic-to-png/'; label = 'Convert HEIC to PNG (lossless output for editing)' }
            @{ href = '/en/convert/heic-to-pdf/'; label = 'Convert HEIC to PDF (send photos as a document)' }
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (reduce image file size)' }
            @{ href = '/en/convert/avif-to-jpg/'; label = 'Convert AVIF to JPG (next-gen format to universal)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'Does converting HEIC to JPG reduce quality?'; a = 'JPG is lossy, so some quality is traded for smaller size. At quality 90+ the difference is invisible to the naked eye. HEIC itself is also lossy, so you are re-compressing already-compressed data — keep quality at 85 or higher to avoid artefacts.' }
            @{ q = 'Can I convert HEIC to JPG without installing Apple software?'; a = 'Yes. File Converter Pro uses its own built-in HEIF decoder and does not require Apple iTunes, iCloud, or the HEIF Image Extensions from the Microsoft Store. It works out of the box on a clean Windows installation.' }
            @{ q = 'Will GPS and date metadata be kept in the JPG?'; a = 'By default, yes. File Converter Pro copies all EXIF tags — GPS coordinates, date/time original, camera model, focal length — into the output JPG. You can disable EXIF export per batch if you want to share photos without location data.' }
            @{ q = 'How many HEIC files can I convert at once?'; a = 'There is no limit. The queue accepts entire folders including subfolders. A typical iPhone Camera Roll of 2000 photos converts in under ten minutes on a modern Windows laptop.' }
        )
        outputOptions = @(
            'JPG quality 1-100 (default 85)'
            'EXIF / metadata preserve or strip'
            'sRGB colour space conversion'
            'Custom output folder'
            'Batch from folder or multi-select'
            'Original filename preserved'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store, drop your HEIC photos into the queue, and have universally compatible JPGs ready in minutes — fully offline, no upload, no watermark, no size cap.'
    },

    @{
        slug = 'heic-to-png'
        from = 'HEIC'
        to = 'PNG'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert HEIC to PNG on Windows — Offline | File Converter Pro'
        desc = 'Convert HEIC to PNG on Windows 10 and 11 offline. Lossless output, batch iPhone photos, keep EXIF — no upload, no size limit. Free trial available.'
        h1 = 'Convert HEIC to PNG on Windows — Lossless &amp; Offline'
        heroSubtitle = 'Export iPhone HEIC photos to lossless PNG on your Windows PC — no cloud upload, perfect quality preserved, free trial included.'
        whyHtml = @'
                    <p>PNG uses lossless compression, making it the right output format whenever you need <strong>pixel-perfect quality with no generation loss</strong>. Designers and photographers use HEIC → PNG when they want to open iPhone photos in tools like Figma, GIMP, or older versions of Photoshop that do not support HEIF natively, without any risk of additional compression artefacts.</p>
                    <p>PNG is also the format of choice for screenshots, product images, and graphics that will be edited or composited further. If you shoot iPhone photos of documents, product prototypes, or UI mockups for use in design workflows, PNG preserves every pixel exactly as captured — no lossy re-compression that could blur fine text or moiré patterns.</p>
                    <p>The trade-off is file size: PNG files are considerably larger than JPG or the source HEIC. For a 12 MP iPhone shot, a PNG at full resolution can be 8-20 MB versus 3-5 MB for a quality-85 JPG. If you need the smallest possible sharing file, choose JPG. If quality is non-negotiable, PNG is the right call.</p>
                    <p>File Converter Pro converts HEIC to PNG entirely offline on Windows 10 and 11 — no Apple software needed, no upload, no per-file limit. The batch queue handles a full Camera Roll folder in one pass, with each output file named identically to its source HEIC.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Get File Converter Pro from the Microsoft Store. The free trial supports full-resolution HEIC to PNG conversion before the €6.49 one-time purchase.' }
            @{ name = 'Add HEIC photos to the queue'; text = 'Drag individual HEIC files, a multi-selection, or an entire folder into the app. HEIC files from any iPhone or iPad model are supported.' }
            @{ name = 'Select PNG as the output format'; text = 'Choose PNG in the output panel. PNG has no lossy quality slider — lossless compression is automatic. You can choose PNG-8 (256 colours, smaller) or PNG-24 (full colour depth, default for photos).' }
            @{ name = 'Convert locally'; text = 'Click Convert. Files are processed on your Windows PC with no upload. Output PNGs are saved to your chosen folder. A 12 MP HEIC converts to PNG in roughly one second on a modern CPU.' }
        )
        batchHtml = @'
                    <p>For design workflows that ingest batches of iPhone photos — product shoots, site visits, research documentation — PNG output means every image is ready for direct import into Figma, Adobe XD, or Photoshop without an intermediate conversion step in the design tool itself.</p>
                    <ul>
                        <li>Process a full shoot (200+ HEIC photos) in a single batch run.</li>
                        <li>Preserve the source folder structure on output, keeping project files organised.</li>
                        <li>Strip or retain EXIF metadata in bulk — useful when sharing prototype photos externally.</li>
                        <li>Mix HEIC and other input formats in the same queue run if needed.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>PNG is inherently lossless — there is no quality setting that degrades pixel data. What you can tune is <strong>compression level</strong>, which affects file size and encode speed but not visual quality at all.</p>
                    <ul>
                        <li><strong>Compression 0:</strong> fastest encode, largest file size. Good for intermediate files in a pipeline where disk space is not a concern.</li>
                        <li><strong>Compression 6 (default):</strong> balanced speed and size. Recommended for most workflows.</li>
                        <li><strong>Compression 9:</strong> smallest file, slowest encode. Useful when the output PNGs will be served on a website or sent over slow connections.</li>
                        <li><strong>Colour depth:</strong> PNG-24 (true colour, 16M colours) is the default for photos. PNG-8 reduces to 256 colours — suitable only for simple graphics, not photographs.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Output PNG files are very large.</strong> That is expected — PNG is lossless. A 12 MP photo PNG is typically 10-20 MB. If file size matters, use JPG output at quality 85-90 instead.</li>
                        <li><strong>Wide-gamut colours look oversaturated.</strong> iPhone P3 wide-gamut images need a colour-space conversion to sRGB for correct rendering in non-colour-managed apps. Enable the sRGB conversion option in File Converter Pro.</li>
                        <li><strong>Alpha channel missing.</strong> HEIC photos do not carry transparency. The PNG output will have a white or black background depending on settings — this is expected behaviour for photographic HEIC sources.</li>
                        <li><strong>Conversion speed is slower than JPG.</strong> PNG lossless compression is CPU-intensive. Use compression level 0 if you need the fastest possible batch run.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/heic-to-jpg/'; label = 'Convert HEIC to JPG (smaller files for sharing)' }
            @{ href = '/en/convert/heic-to-pdf/'; label = 'Convert HEIC to PDF (package photos as document)' }
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (reduce size for web)' }
            @{ href = '/en/convert/avif-to-png/'; label = 'Convert AVIF to PNG (next-gen to lossless)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'Is HEIC to PNG conversion really lossless?'; a = 'Yes, the PNG output is lossless — no pixel data is discarded during PNG compression. However, HEIC itself is a lossy format (like JPEG), so the PNG preserves the HEIC image exactly, including any compression already applied by the camera.' }
            @{ q = 'Why are my PNG files so much larger than the source HEIC?'; a = 'HEIC uses very efficient lossy compression, while PNG uses lossless compression. A 3 MB HEIC photo may expand to 15 MB as PNG. This is normal and expected. Use JPG output if smaller files are more important than losslessness.' }
            @{ q = 'Can I batch-convert an entire iPhone Camera Roll to PNG?'; a = 'Yes. Connect your iPhone to Windows, open File Converter Pro, and drag the DCIM folder into the queue. The app processes all HEIC files in subfolders automatically.' }
            @{ q = 'Do I need Apple iCloud or iTunes to convert HEIC to PNG on Windows?'; a = 'No. File Converter Pro has its own built-in HEIF decoder. It works on a completely clean Windows 10 or 11 installation without any Apple software.' }
        )
        outputOptions = @(
            'PNG-24 (full colour, lossless)'
            'PNG-8 (256-colour palette)'
            'Compression level 0-9'
            'sRGB colour space conversion'
            'EXIF preserve or strip'
            'Batch from folder'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your HEIC photos to lossless PNG offline — full quality, no upload, no watermark, no per-file size cap.'
    },

    @{
        slug = 'heic-to-pdf'
        from = 'HEIC'
        to = 'PDF'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert HEIC to PDF on Windows — Batch | File Converter Pro'
        desc = 'Convert HEIC photos to PDF on Windows 10 and 11 offline. Batch-merge iPhone pictures into one PDF or one PDF per image. No upload, no watermark. Try free.'
        h1 = 'Convert HEIC to PDF on Windows — Offline &amp; Batch'
        heroSubtitle = 'Package iPhone HEIC photos into a PDF document on Windows — merge many photos into one file or one PDF per image, fully offline, no upload.'
        whyHtml = @'
                    <p>PDF is the universal document format for sharing and archiving. Converting HEIC photos to PDF lets you <strong>send an entire photo set as a single attachment</strong> — invoices, insurance claim photos, real-estate property shots, travel documentation — in a format every recipient can open on any device without needing Apple software.</p>
                    <p>There are two common scenarios: merging multiple HEIC photos into one multi-page PDF (useful for reports, portfolios, and documentation packages), and generating one PDF per photo (useful when each image needs its own searchable file). File Converter Pro handles both modes in the same batch run.</p>
                    <p>Unlike emailing individual HEIC files that Windows users cannot open, a PDF is universally readable in browsers, email clients, and document viewers. For professionals submitting claims, proposals, or inspection reports with iPhone photos, HEIC → PDF is the clean path from capture to delivery.</p>
                    <p>The conversion runs entirely offline on your Windows 10 or 11 PC. Photos never leave your machine — critical for legal, medical, or confidential business images where uploading to a third-party server is not acceptable.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Get File Converter Pro from the Microsoft Store. The free trial includes HEIC to PDF conversion at full resolution.' }
            @{ name = 'Add HEIC files and set merge mode'; text = 'Drag HEIC photos into the queue. Choose "Merge to one PDF" to combine all photos into a single multi-page document, or "One PDF per image" for individual files.' }
            @{ name = 'Set page size and orientation'; text = 'Pick a page size (A4, Letter, or fit-to-image). Choose portrait or landscape. For photo documentation, "fit to page" scales each image to fill the PDF page without borders.' }
            @{ name = 'Convert offline'; text = 'Click Convert. The PDF is generated locally — no upload. A 50-photo merge typically completes in under 30 seconds on a modern Windows laptop.' }
        )
        batchHtml = @'
                    <p>Professional workflows often need to package dozens of job-site photos, inspection images, or product shots into a single deliverable PDF. File Converter Pro handles this without per-page limits or upload quotas.</p>
                    <ul>
                        <li>Merge up to thousands of HEIC images into one PDF in a single run.</li>
                        <li>Control page order by dragging files in the queue before converting.</li>
                        <li>Run multiple separate merge jobs from one session — useful for organising photos by project or date.</li>
                        <li>Output file size can be managed by setting image compression quality before conversion.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>PDF files containing photos embed images at a quality you control. Higher quality means larger PDFs; lower quality means smaller, more email-friendly files.</p>
                    <ul>
                        <li><strong>High quality (95):</strong> best for print or legal documentation where image clarity matters. Files can be 5-15 MB per photo.</li>
                        <li><strong>Standard quality (85):</strong> the default — excellent visual quality for screen viewing and email sharing, roughly 1-3 MB per photo.</li>
                        <li><strong>Web quality (70):</strong> compact output for quick sharing or uploads where file size is more important than print quality.</li>
                        <li><strong>DPI setting:</strong> 150 DPI is sufficient for screen viewing; use 300 DPI for print output.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Photos appear rotated in the PDF.</strong> The HEIC has EXIF orientation metadata. File Converter Pro applies EXIF rotation automatically — if output is still wrong, toggle the auto-rotate option in settings.</li>
                        <li><strong>PDF is unexpectedly large.</strong> Each photo is embedded at full resolution. Reduce JPEG quality to 70-80 in the output settings to cut file size significantly while keeping acceptable visual quality.</li>
                        <li><strong>Wrong page order in merged PDF.</strong> Drag files in the queue to reorder them before clicking Convert. Alphabetical sort is the default.</li>
                        <li><strong>Colour looks different from iPhone screen.</strong> iPhone displays are wide-gamut P3. Enable sRGB conversion so the PDF colours look correct on standard Windows and Android screens.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/heic-to-jpg/'; label = 'Convert HEIC to JPG (universal photo format)' }
            @{ href = '/en/convert/jpg-to-pdf/'; label = 'Convert JPG to PDF (photos to document)' }
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (lossless images to document)' }
            @{ href = '/en/convert/image-to-pdf/'; label = 'Convert Images to PDF (any format to PDF)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Can I merge multiple HEIC photos into one PDF?'; a = 'Yes. Select all your HEIC files, choose the "Merge to one PDF" mode, set page order in the queue, and click Convert. All photos become pages in a single PDF document.' }
            @{ q = 'Will the PDF work on Windows PCs without Apple software?'; a = 'Absolutely. PDFs are universally readable in any browser (Chrome, Edge, Firefox), Adobe Reader, and Windows built-in PDF viewer. Recipients need no Apple software whatsoever.' }
            @{ q = 'Is there a limit to how many HEIC files I can convert to PDF at once?'; a = 'No limit. File Converter Pro handles batches of hundreds of photos. Typical professional use cases like property inspection reports (50-100 photos) complete in under a minute.' }
            @{ q = 'Does the conversion work offline?'; a = 'Yes, completely. File Converter Pro processes everything locally on your Windows 10 or 11 PC. No photos are uploaded to any server at any point.' }
        )
        outputOptions = @(
            'Merge to one PDF or one PDF per image'
            'A4 / Letter / fit-to-image page size'
            'Portrait or landscape orientation'
            'JPEG quality 70-95 in PDF'
            '72 / 150 / 300 DPI'
            'EXIF auto-rotation'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and turn your HEIC photos into professional PDF documents in seconds — fully offline, no upload, no watermark, no page limits.'
    },

    @{
        slug = 'avif-to-jpg'
        from = 'AVIF'
        to = 'JPG'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert AVIF to JPG on Windows — Free Trial | File Converter Pro'
        desc = 'Convert AVIF to JPG on Windows 10 and 11 offline. Batch-convert next-gen images to universal JPEG with no upload, no size limit, no watermark. Try free.'
        h1 = 'Convert AVIF to JPG on Windows — Offline &amp; Batch'
        heroSubtitle = 'Decode next-generation AVIF images to universally compatible JPGs on Windows — fully offline, free trial, no upload required.'
        whyHtml = @'
                    <p>AVIF (AV1 Image File Format) is the newest image standard, delivering <strong>50 % smaller files than JPEG at equivalent quality</strong> by leveraging the AV1 video codec for still images. Chrome, Firefox, and modern Android ship AVIF support natively. The problem: Windows Photo Viewer, most legacy graphics software, email clients, and content management systems still do not handle AVIF — they either display a broken icon or refuse the upload.</p>
                    <p>Converting AVIF to JPG gives you a file that opens everywhere: Windows Photos, Paint, Photoshop CS, IrfanView, Lightroom Classic, every email client, and every web platform''s upload form. JPEG''s universal compatibility comes at the cost of somewhat larger file sizes, but that trade-off is worth it when you need the image to just work.</p>
                    <p>Common sources of AVIF images include web scraping, downloaded assets from modern CDNs, exported images from Chrome DevTools, and stock photo sites that now default to AVIF delivery. Designers working from reference libraries frequently encounter AVIF files that their tools cannot ingest.</p>
                    <p>File Converter Pro decodes AVIF and writes JPG entirely offline on Windows 10 and 11. No upload required, no browser tricks, no format-conversion web service needed.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial supports full-resolution AVIF to JPG conversion.' }
            @{ name = 'Add AVIF files to the queue'; text = 'Drag AVIF files into the app — single files or a folder. AVIF files from any source are accepted, including downloaded web assets and exported browser captures.' }
            @{ name = 'Select JPG and quality'; text = 'Choose JPG as output. Set quality 85-90 for general use. The app shows an estimated output file size before you start.' }
            @{ name = 'Convert locally'; text = 'Click Convert. AVIF decoding and JPG encoding run on your CPU with no upload. Output JPGs are saved to your specified folder.' }
        )
        batchHtml = @'
                    <p>Designers and developers who work with modern web assets often download or generate batches of AVIF images that need to be converted for use in legacy tools or client deliverables. File Converter Pro handles these batches efficiently.</p>
                    <ul>
                        <li>Process dozens or hundreds of AVIF files in a single queue run.</li>
                        <li>Mixed AVIF and other formats in the same folder are handled without errors.</li>
                        <li>Output JPGs keep the original filenames with the extension swapped.</li>
                        <li>No internet connection needed — works in air-gapped environments.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>When converting AVIF (a lossy format) to JPG (also lossy), you are re-compressing already-compressed image data. Setting JPG quality too low doubles the compression artefacts. Recommended settings:</p>
                    <ul>
                        <li><strong>Quality 90:</strong> near-transparent loss, recommended for photos and design assets.</li>
                        <li><strong>Quality 85:</strong> excellent balance for general use — typically half the original AVIF file size.</li>
                        <li><strong>Quality 75:</strong> compact web thumbnails. Visible artefacts on close inspection but fine at normal zoom.</li>
                        <li><strong>Colour space:</strong> AVIF supports wide-gamut and HDR. File Converter Pro converts to sRGB for JPG output, ensuring correct colours in all viewers.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Output JPG looks different from AVIF in browser.</strong> Browsers display AVIF in wide-gamut or HDR mode if supported. The JPG output uses sRGB — colours may look slightly less vivid but will be accurate and consistent across all apps.</li>
                        <li><strong>AVIF file not recognised.</strong> Some AVIF files use an older file-type box or a different MIME subtype. File Converter Pro handles most AVIF variants including .avif and .avifs sequences.</li>
                        <li><strong>Transparency in AVIF not carried over.</strong> AVIF supports alpha channels; JPG does not. Transparent areas are composited on white by default. Switch to PNG output if you need to preserve transparency.</li>
                        <li><strong>Conversion slower than expected.</strong> AVIF decoding is CPU-intensive due to AV1 complexity. A modern 4-core CPU decodes roughly 10-20 AVIF images per second at 4K resolution.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/avif-to-png/'; label = 'Convert AVIF to PNG (lossless, preserves transparency)' }
            @{ href = '/en/convert/heic-to-jpg/'; label = 'Convert HEIC to JPG (iPhone photos to JPEG)' }
            @{ href = '/en/convert/webp-to-jpg/'; label = 'Convert WebP to JPG (another next-gen format)' }
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (lossless to compressed)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'What is AVIF and why can my software not open it?'; a = 'AVIF (AV1 Image File Format) is a next-generation image format built on the AV1 video codec. It launched in 2019 and is supported by modern browsers but not yet by most desktop software, Windows Explorer thumbnails, or legacy graphics apps. Converting to JPG gives you a file that opens everywhere.' }
            @{ q = 'Does converting AVIF to JPG degrade quality significantly?'; a = 'At quality 85-90 the degradation is minimal and invisible at normal viewing sizes. Because AVIF is already lossy, you are re-compressing — keep quality at 85 or above to avoid stacking artefacts.' }
            @{ q = 'Can I convert AVIF files in bulk?'; a = 'Yes. Drag a folder of AVIF files into File Converter Pro and all of them are added to the batch queue. There is no per-file limit on count or size.' }
            @{ q = 'Does converting AVIF to JPG preserve transparency?'; a = 'No — JPG does not support transparency. Transparent areas are filled with white (or a colour you choose). If you need transparency preserved, convert to PNG instead.' }
        )
        outputOptions = @(
            'JPG quality 1-100 (default 85)'
            'sRGB colour space conversion'
            'HDR tone-mapping to SDR'
            'Transparency composited on white'
            'EXIF preserve or strip'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your AVIF images to universally compatible JPGs offline — no upload, no watermark, no size limit.'
    },

    @{
        slug = 'avif-to-png'
        from = 'AVIF'
        to = 'PNG'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert AVIF to PNG on Windows — Offline | File Converter Pro'
        desc = 'Convert AVIF to PNG on Windows 10 and 11 offline. Lossless output, preserve transparency, batch-process next-gen images. No upload, no watermark. Try free.'
        h1 = 'Convert AVIF to PNG on Windows — Lossless &amp; Offline'
        heroSubtitle = 'Decode AVIF images to lossless PNG on Windows — preserves transparency and full quality, no upload, batch processing, free trial.'
        whyHtml = @'
                    <p>PNG output is the right choice when you need <strong>lossless quality and preserved transparency</strong> from an AVIF source. Unlike JPG, PNG can store an alpha channel — so if your AVIF image has a transparent background (common in product shots, icons, and UI assets served from modern CDNs), PNG is the only lossless format that keeps it intact.</p>
                    <p>Developers who scrape or download web assets increasingly encounter AVIF files from CDNs that have switched to the new format for bandwidth savings. Those assets often need to be imported into design tools, game engines, or CMS platforms that accept PNG but not AVIF. AVIF → PNG is the clean, lossless path.</p>
                    <p>PNG is also useful as an intermediate format when you need to do further editing. Going AVIF → PNG → edited PNG → final export avoids the double-lossy artefacts that come from AVIF → JPG → re-edit → JPG. For designers doing colour correction or compositing on next-gen web assets, this is the standard workflow.</p>
                    <p>File Converter Pro handles the decode and encode entirely offline on Windows 10 and 11, with support for alpha channels, wide-gamut colour conversion, and batch processing of entire asset folders.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Install File Converter Pro from the Microsoft Store. Try it free before the €6.49 one-time purchase.' }
            @{ name = 'Drop AVIF files into the queue'; text = 'Drag one or more AVIF files, or an entire folder, into the app. AVIF files with and without transparency (alpha channel) are both supported.' }
            @{ name = 'Select PNG as output'; text = 'Pick PNG in the output panel. PNG-24 is the default for full-colour images with or without transparency. PNG-8 is available for simple graphics with limited colours.' }
            @{ name = 'Convert offline'; text = 'Click Convert. Output PNGs are saved to your chosen folder. Transparency in the source AVIF is carried over to the PNG alpha channel automatically.' }
        )
        batchHtml = @'
                    <p>Web developers and designers who manage asset libraries frequently need to convert batches of AVIF files downloaded from CDNs or exported by design tools. File Converter Pro runs these batches without a per-file limit.</p>
                    <ul>
                        <li>Convert an entire folder of AVIF assets to PNG in one pass.</li>
                        <li>Alpha channels are preserved automatically — no manual transparency settings needed.</li>
                        <li>Original filenames are retained with the .png extension substituted.</li>
                        <li>Works offline in build pipelines and CI environments without internet access.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>PNG is lossless — there is no quality setting that affects pixel fidelity. You can tune the compression level to trade encode speed for file size without any visual impact:</p>
                    <ul>
                        <li><strong>Compression 0:</strong> fastest, largest file — good for intermediate pipeline files.</li>
                        <li><strong>Compression 6 (default):</strong> well-balanced size and speed for most use cases.</li>
                        <li><strong>Compression 9:</strong> smallest files, slowest encode — use when serving PNG files over the web or in tight storage budgets.</li>
                        <li><strong>Alpha handling:</strong> AVIF alpha channels are preserved directly in the PNG. No background fill is applied unless you explicitly choose to flatten.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>PNG files are much larger than AVIF.</strong> Expected. AVIF uses very efficient lossy compression; PNG is lossless and larger by nature. For web delivery, consider keeping AVIF; use PNG for editing or tool compatibility.</li>
                        <li><strong>HDR AVIF looks washed out as PNG.</strong> AVIF supports HDR (HLG/PQ); standard PNG does not carry HDR metadata. File Converter Pro tone-maps HDR to SDR for the PNG output. Enable the tone-mapping option in settings if colours look dull.</li>
                        <li><strong>Animation not converted.</strong> Animated AVIF sequences (AVIFS) extract the first frame only for PNG output. Use the video converter for animated sequences.</li>
                        <li><strong>Wide-gamut colours shifted.</strong> Enable sRGB conversion in the output settings if your AVIF uses Display P3 and you need consistent colours across non-colour-managed apps.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/avif-to-jpg/'; label = 'Convert AVIF to JPG (smaller file for sharing)' }
            @{ href = '/en/convert/heic-to-png/'; label = 'Convert HEIC to PNG (iPhone photos to lossless)' }
            @{ href = '/en/convert/webp-to-png/'; label = 'Convert WebP to PNG (another next-gen to lossless)' }
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (reduce PNG file size)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'Does converting AVIF to PNG preserve transparency?'; a = 'Yes. AVIF supports alpha channels and File Converter Pro carries them over to the PNG alpha channel automatically. The transparency information is not lost.' }
            @{ q = 'Why is my PNG output so much larger than the AVIF source?'; a = 'AVIF uses lossy AV1 compression — it is very compact. PNG is lossless and uncompressed in the visual sense. A 200 KB AVIF may become a 2-4 MB PNG. This is normal and expected.' }
            @{ q = 'Can I batch-convert a folder of AVIF web assets to PNG?'; a = 'Yes. Drop the entire folder into File Converter Pro and it processes all AVIF files in one run, preserving filenames with .png extensions.' }
            @{ q = 'Can I convert animated AVIF to PNG?'; a = 'File Converter Pro extracts the first frame of an animated AVIF sequence as a static PNG. For full animated output, use the video converter path to export frames or convert to GIF/WebM.' }
        )
        outputOptions = @(
            'PNG-24 with alpha channel'
            'PNG-8 for simple graphics'
            'Compression level 0-9'
            'sRGB colour space conversion'
            'HDR tone-mapping to SDR'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro and convert your AVIF images to lossless PNG offline — transparency preserved, no upload, no watermark, no file size cap.'
    },

    @{
        slug = 'jfif-to-jpg'
        from = 'JFIF'
        to = 'JPG'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert JFIF to JPG on Windows — Offline | File Converter Pro'
        desc = 'Convert JFIF to JPG on Windows 10 and 11 offline. Rename and re-encode JFIF photos to standard JPEG with no upload, no watermark. Free trial available.'
        h1 = 'Convert JFIF to JPG on Windows — Offline &amp; Batch'
        heroSubtitle = 'Rename and convert JFIF image files to standard JPG on Windows — no upload, batch processing, free trial, fully offline.'
        whyHtml = @'
                    <p>JFIF (JPEG File Interchange Format) is technically JPEG image data stored with the .jfif file extension. The two formats are identical in their image encoding — JFIF is simply a specific header convention for JPEG. The problem is the file extension: <strong>most Windows applications, email clients, upload forms, and photo editors only recognise .jpg or .jpeg as JPEG files</strong>. A .jfif file displays an unknown-file icon in Windows Explorer and fails to upload on many websites.</p>
                    <p>JFIF files are most commonly encountered when saving images from certain web browsers (particularly Chromium-based browsers like Chrome and Edge, which sometimes download JPEG images with the .jfif extension), from web-scraping tools, and from some older digital cameras.</p>
                    <p>Converting JFIF to JPG is essentially a matter of correct re-encoding into a standard JPEG container with the .jpg extension that every application recognises. The image quality is preserved at the level you specify — high-quality re-encoding is indistinguishable from a native JPG capture at the same megapixel count.</p>
                    <p>File Converter Pro handles this entirely locally on Windows 10 and 11 — no browser workaround, no online converter, no upload of personal photos. The batch queue handles a folder of downloaded JFIF images in a single pass.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Get File Converter Pro from the Microsoft Store. The free trial supports JFIF to JPG conversion without watermarks or time limits.' }
            @{ name = 'Add JFIF files to the queue'; text = 'Drag .jfif files from Windows Explorer into the app. You can also drop an entire folder if you have multiple JFIF images to convert.' }
            @{ name = 'Select JPG as the output format'; text = 'Choose JPG in the output panel. Set quality 85-95 for best results. Since JFIF and JPEG share the same underlying encoding, high-quality re-encoding is very clean.' }
            @{ name = 'Convert and use your JPGs'; text = 'Click Convert. Output .jpg files are saved to your chosen folder. They will display correct thumbnails in Windows Explorer and upload successfully to any web form.' }
        )
        batchHtml = @'
                    <p>If you download many images from the web or receive a bulk export from a tool that outputs JFIF, processing them one by one is tedious. File Converter Pro accepts an entire folder of JFIF files in a single batch run.</p>
                    <ul>
                        <li>Process hundreds of JFIF files in one click — no per-file cap.</li>
                        <li>Output files keep original filenames with .jpg extension substituted.</li>
                        <li>EXIF metadata (if present in the JFIF) is preserved in the output JPG.</li>
                        <li>Works offline — no internet connection required.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>Because JFIF is already JPEG data, you are re-encoding from one JPEG to another. To minimise quality loss from double compression, use a high quality setting:</p>
                    <ul>
                        <li><strong>Quality 92-95:</strong> near-transparent loss. Recommended for photos and images where fidelity matters.</li>
                        <li><strong>Quality 85:</strong> excellent balance — reduces file size slightly while keeping quality visually identical.</li>
                        <li><strong>Quality 75:</strong> compact output. Suitable for thumbnails and web previews where file size is more important than pixel precision.</li>
                        <li><strong>Note:</strong> if the JFIF was a high-quality image, re-encoding at quality 85+ will look identical. Avoid very low quality settings on already-compressed sources.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Windows Explorer still shows unknown icon.</strong> Make sure the output file has the .jpg extension, not .jpeg or .jfif. Both .jpg and .jpeg work in Windows, but the app outputs .jpg by default.</li>
                        <li><strong>Image looks slightly softer than original.</strong> Re-encoding always applies slight loss. Use quality 92-95 to keep it minimal. If exact pixel preservation is required, simply renaming the file extension (without re-encoding) can be enough — though some apps still need a proper re-encode.</li>
                        <li><strong>EXIF data missing in output.</strong> Enable EXIF preservation in the output settings. Some JFIF files lack EXIF data; in that case nothing is lost.</li>
                        <li><strong>Upload form still rejects file.</strong> Some forms check MIME type by reading file headers, not just the extension. A proper re-encode through File Converter Pro writes a standard JFIF/JPEG header that all validators accept.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (lossless to JPEG)' }
            @{ href = '/en/convert/heic-to-jpg/'; label = 'Convert HEIC to JPG (iPhone photos to JPEG)' }
            @{ href = '/en/convert/avif-to-jpg/'; label = 'Convert AVIF to JPG (next-gen to JPEG)' }
            @{ href = '/en/convert/webp-to-jpg/'; label = 'Convert WebP to JPG (modern web format to JPEG)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'Is JFIF the same as JPEG?'; a = 'Yes, essentially. JFIF (JPEG File Interchange Format) uses the same JPEG image encoding — the difference is only in the file header and the .jfif extension. The image data is identical. Converting to JPG re-encodes into a standard JPEG container that all software recognises.' }
            @{ q = 'Why does my browser save images as .jfif instead of .jpg?'; a = 'Some versions of Chrome and Edge follow the server-declared MIME type (image/jpeg → .jfif extension). It is a browser behaviour based on the MIME-to-extension mapping. The image data is the same JPEG quality.' }
            @{ q = 'Will re-encoding from JFIF to JPG degrade quality?'; a = 'At quality 85-95 the difference is invisible. Since JFIF is already lossy JPEG data, avoid very low quality settings to prevent stacking compression artefacts.' }
            @{ q = 'Can I simply rename .jfif to .jpg without converting?'; a = 'Sometimes — if the application only checks the extension. But many apps and upload forms validate the file header (magic bytes). A proper re-encode through File Converter Pro writes a fully conformant JPEG header that works everywhere.' }
        )
        outputOptions = @(
            'JPG quality 1-100 (default 85)'
            'EXIF preserve or strip'
            'Standard JPEG container header'
            'Batch from folder'
            'Original filename with .jpg extension'
            'No upload required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your JFIF files to standard JPG offline — no upload, no watermark, no size limit, free trial available.'
    },

    @{
        slug = 'tiff-to-pdf'
        from = 'TIFF'
        to = 'PDF'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert TIFF to PDF on Windows — Batch | File Converter Pro'
        desc = 'Convert TIFF to PDF on Windows 10 and 11 offline. Batch-merge scanned documents and TIFF images into PDF. No upload, no size limit, no watermark. Try free.'
        h1 = 'Convert TIFF to PDF on Windows — Offline &amp; Batch'
        heroSubtitle = 'Turn scanned TIFFs and multi-page TIFF documents into PDF files on Windows — batch merge, fully offline, no upload, no size cap.'
        whyHtml = @'
                    <p>TIFF (Tagged Image File Format) is the standard archival format for scanned documents, medical imaging, and professional photography. Scanners, document management systems, and reprographics workflows produce TIFF files routinely. The problem is distribution: <strong>TIFF is not a universal viewing format</strong> — most email clients display TIFFs as attachments rather than inline, web browsers do not render them, and most users cannot open them without dedicated software.</p>
                    <p>PDF is the distribution standard for scanned documents. Converting TIFF → PDF means your scanned contracts, invoices, land surveys, medical reports, or archival documents can be opened by anyone on any device using the free PDF viewer already installed. The visual quality of the source scan is fully preserved in the PDF.</p>
                    <p>Multi-page TIFF is a specific use case worth calling out: scanners often produce a single .tiff file containing tens or hundreds of pages from a document feed. File Converter Pro converts multi-page TIFFs to multi-page PDFs, preserving the page sequence exactly. Batch single-page TIFFs can be merged into one PDF or kept as individual documents.</p>
                    <p>The conversion runs entirely offline — essential for legal, medical, and government documents that must not leave the local network.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial supports TIFF to PDF conversion at full resolution.' }
            @{ name = 'Add TIFF files to the queue'; text = 'Drag TIFF files into the app. Single-page TIFFs, multi-page TIFFs, and folders of scanned pages are all supported. The app detects multi-page TIFFs automatically.' }
            @{ name = 'Choose single PDF or merged PDF'; text = 'Select "One PDF per TIFF" for individual documents, or "Merge all to one PDF" to combine a batch of scanned pages into a single file.' }
            @{ name = 'Convert offline'; text = 'Click Convert. Output PDFs are generated locally — no upload. A 100-page scanned TIFF document converts to PDF in under a minute on modern hardware.' }
        )
        batchHtml = @'
                    <p>Document digitisation projects often produce folders of thousands of TIFF scans that all need to become PDFs. File Converter Pro handles these production batches without per-file limits.</p>
                    <ul>
                        <li>Process entire folders of TIFF scans in one run — no job size limit.</li>
                        <li>Multi-page TIFFs are correctly expanded into multi-page PDFs.</li>
                        <li>Folder structure can be mirrored in the output directory for organised archive maintenance.</li>
                        <li>The queue continues uninterrupted even if individual corrupt TIFFs are found — they are logged and skipped.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>TIFF is usually uncompressed or losslessly compressed (LZW). When embedding in PDF you can choose how the image is stored:</p>
                    <ul>
                        <li><strong>Lossless (TIFF/LZW in PDF):</strong> preserves every pixel exactly. Larger PDF files but zero quality loss. Use for archival, legal, and medical records where pixel fidelity is required.</li>
                        <li><strong>JPEG in PDF (quality 90):</strong> good for scanned text and photographs where a slight compression is acceptable. Significantly smaller PDF.</li>
                        <li><strong>JPEG in PDF (quality 75):</strong> compact PDFs for email distribution. Slight visible softness on very fine text at high zoom.</li>
                        <li><strong>DPI settings:</strong> preserve source DPI (typically 300 or 600 for document scans) or downsample for smaller files.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Multi-page TIFF only exports one page.</strong> Ensure the multi-page TIFF option is enabled in the output settings. The app detects multi-page TIFFs automatically in most cases.</li>
                        <li><strong>PDF pages are black-and-white when source was colour.</strong> The TIFF was probably saved as 1-bit bilevel (fax/G4) by the scanner. This is the source data, not a conversion error. Use a higher-quality scan setting on your scanner for colour output.</li>
                        <li><strong>Very large PDF output.</strong> Lossless embedding of 300 DPI scans produces large files. Switch to JPEG quality 85 in the output settings to significantly reduce PDF size while keeping text readable.</li>
                        <li><strong>Page order wrong in merged PDF.</strong> Drag to reorder files in the queue before converting. Default sort is alphabetical.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (lossless images to document)' }
            @{ href = '/en/convert/jpg-to-pdf/'; label = 'Convert JPG to PDF (photos to document)' }
            @{ href = '/en/convert/image-to-pdf/'; label = 'Convert Images to PDF (any format to PDF)' }
            @{ href = '/en/convert/heic-to-pdf/'; label = 'Convert HEIC to PDF (iPhone photos to document)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Can File Converter Pro convert multi-page TIFF to PDF?'; a = 'Yes. Multi-page TIFF files — where a single .tiff stores dozens of document pages — are converted to equally multi-page PDFs with the correct page sequence preserved.' }
            @{ q = 'Will TIFF to PDF conversion reduce image quality?'; a = 'Only if you choose JPEG embedding in the PDF output settings. With lossless embedding (the default for archival use), every pixel is preserved exactly. Choose lossless for legal, medical, or archival PDFs.' }
            @{ q = 'Can I merge many individual TIFF scans into one PDF?'; a = 'Yes. Add all your TIFF files to the queue, set the merge mode to "Combine all into one PDF," arrange page order in the queue, and convert. The result is one multi-page PDF.' }
            @{ q = 'Does TIFF to PDF conversion work offline?'; a = 'Yes. Everything runs locally on your Windows 10 or 11 PC. Your scanned documents — legal contracts, medical records, financial reports — never leave your machine.' }
        )
        outputOptions = @(
            'One PDF per TIFF or merge all'
            'Lossless or JPEG embedding'
            'JPEG quality 70-95 in PDF'
            'Preserve source DPI or downsample'
            'Multi-page TIFF support'
            'A4 / Letter / fit-to-image pages'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your TIFF scans to professional PDF documents offline — no upload, no watermark, no page or size limits.'
    },

    @{
        slug = 'webp-to-png'
        from = 'WebP'
        to = 'PNG'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert WebP to PNG on Windows — Offline | File Converter Pro'
        desc = 'Convert WebP to PNG on Windows 10 and 11 offline. Lossless output, preserve transparency, batch web assets to PNG. No upload, no size limit. Try free.'
        h1 = 'Convert WebP to PNG on Windows — Lossless &amp; Offline'
        heroSubtitle = 'Export WebP images to lossless PNG on Windows — preserves transparency, batch processing, fully offline, free trial.'
        whyHtml = @'
                    <p>WebP is Google''s modern web image format — efficient, widely supported in browsers, but still not natively handled by many desktop applications. Photoshop (pre-2022 versions), older Illustrator, Windows Photo Viewer on older builds, many CMS platforms, and legacy print workflows all need PNG or JPEG. <strong>Converting WebP to PNG gives you the universal lossless format</strong> that every design tool and application accepts without plugins or workarounds.</p>
                    <p>PNG is specifically the right target when the WebP source has transparency — a transparent background for a logo, a product cutout, a UI element with alpha. JPG cannot store transparency; PNG can. For web asset pipelines, game assets, and UI design systems, PNG is the standard interchange format.</p>
                    <p>Developers who download web resources, marketers who receive creative assets, and designers who work with downloaded reference imagery all regularly encounter WebP files. Converting them to PNG unlocks the files for use in the full range of desktop tools and internal platforms.</p>
                    <p>File Converter Pro converts WebP to PNG entirely offline on Windows 10 and 11. No upload, no browser extension required, no online tool needed — just drag and convert.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial supports WebP to PNG conversion at full resolution.' }
            @{ name = 'Drag WebP files into the queue'; text = 'Drop one WebP file, a multi-select, or an entire folder into the app. Lossy WebP and lossless WebP files are both handled.' }
            @{ name = 'Select PNG as output'; text = 'Choose PNG in the output panel. PNG-24 with alpha channel is the default, preserving any transparency in the WebP source.' }
            @{ name = 'Convert locally'; text = 'Click Convert. Output PNGs are saved to your chosen folder. Transparency is carried over automatically.' }
        )
        batchHtml = @'
                    <p>Web asset libraries, downloaded design kits, and scraped image collections often consist entirely of WebP files. File Converter Pro processes these batches efficiently.</p>
                    <ul>
                        <li>Convert entire folders of WebP assets in one run.</li>
                        <li>Transparency (alpha channel) preserved in every output PNG automatically.</li>
                        <li>Filenames retained with .png extension substituted.</li>
                        <li>Works offline in isolated networks — no outbound connections needed.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>PNG output is lossless — no quality slider reduces pixel fidelity. The only tunable parameter is compression level, which affects file size and encode speed but never visual quality:</p>
                    <ul>
                        <li><strong>Compression 6 (default):</strong> excellent balance of file size and speed for all use cases.</li>
                        <li><strong>Compression 9:</strong> smallest file, slowest encode. Best when output PNGs will be served on a website.</li>
                        <li><strong>Compression 0:</strong> fastest encode, largest file. For intermediate files in a fast pipeline.</li>
                        <li><strong>Lossless WebP input:</strong> when the source is lossless WebP, the PNG output is a true lossless copy of the original pixels.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>PNG is much larger than the WebP.</strong> Expected — WebP uses efficient lossy or lossless compression; PNG lossless files are larger by nature. For web delivery keep using WebP; use PNG for editing and tool compatibility.</li>
                        <li><strong>Animated WebP only converts first frame.</strong> For animated WebP, only the first frame is extracted as a static PNG. Convert to GIF or WebM for animated output.</li>
                        <li><strong>Transparency missing in output.</strong> Ensure PNG-24 (not PNG-8) is selected. PNG-8 does not support a full alpha channel — only binary transparency at a palette level.</li>
                        <li><strong>Colour looks slightly different.</strong> Lossy WebP may encode colour differently from the original. PNG output faithfully represents what the WebP contains — any colour shift was in the WebP encoding step, not in the PNG conversion.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/webp-to-jpg/'; label = 'Convert WebP to JPG (smaller file for sharing)' }
            @{ href = '/en/convert/png-to-webp/'; label = 'Convert PNG to WebP (PNG to web-optimised)' }
            @{ href = '/en/convert/avif-to-png/'; label = 'Convert AVIF to PNG (next-gen to lossless)' }
            @{ href = '/en/convert/jpg-to-webp/'; label = 'Convert JPG to WebP (JPG to next-gen web format)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'Does converting WebP to PNG preserve transparency?'; a = 'Yes. WebP supports alpha channels and File Converter Pro carries transparency to the PNG alpha channel. Select PNG-24 (not PNG-8) for full alpha support.' }
            @{ q = 'Is the PNG output lossless even if the source WebP was lossy?'; a = 'The PNG output is a lossless snapshot of the WebP image data. If the WebP was lossy, any compression artefacts that were already in the WebP are preserved faithfully in PNG — but no additional quality loss occurs in conversion.' }
            @{ q = 'Can I convert an entire folder of WebP files to PNG?'; a = 'Yes. Drop the folder into File Converter Pro and all WebP files are converted in one batch run with no file count limit.' }
            @{ q = 'Why are my output PNG files so much larger than the WebP originals?'; a = 'WebP uses very efficient compression (lossy or lossless). PNG lossless files are larger — this is expected. For web delivery, keep using WebP. Use PNG when you need the file for editing in desktop software.' }
        )
        outputOptions = @(
            'PNG-24 with alpha channel (default)'
            'PNG-8 (256-colour palette)'
            'Compression level 0-9'
            'Animated WebP: first frame extraction'
            'Batch folder processing'
            'Filename preserved with .png extension'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your WebP images to lossless PNG offline — transparency preserved, no upload, no watermark, no size limit.'
    },

    @{
        slug = 'jpg-to-webp'
        from = 'JPG'
        to = 'WebP'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert JPG to WebP on Windows — Offline | File Converter Pro'
        desc = 'Convert JPG to WebP on Windows 10 and 11 offline. Reduce image file size by 30-50% for faster websites. Batch processing, no upload, no watermark. Try free.'
        h1 = 'Convert JPG to WebP on Windows — Smaller Files for Web'
        heroSubtitle = 'Re-encode JPG images to WebP for 30-50% smaller file sizes on the web — fully offline on Windows, batch processing, free trial.'
        whyHtml = @'
                    <p>WebP consistently produces <strong>25-50 % smaller files than JPEG at the same visual quality</strong>, as measured by Google''s own benchmarks and confirmed in independent tests. For web developers serving product images, hero photos, and gallery content, switching from JPG to WebP is one of the highest-ROI optimisations available — it reduces page weight, improves Core Web Vitals (LCP), and cuts CDN bandwidth costs.</p>
                    <p>Modern browser support for WebP is universal: Chrome, Edge, Firefox, Safari (since 14), and all major mobile browsers read WebP natively. The <code>&lt;picture&gt;</code> element lets you serve WebP with a JPG fallback for very old browsers, making the transition seamless.</p>
                    <p>Beyond web performance, JPG → WebP is useful for reducing storage footprint in large image libraries. A 10 TB archive of product photography can be reduced to 5-6 TB in WebP without perceptible quality loss — significant savings on storage and backup costs.</p>
                    <p>File Converter Pro encodes JPG to WebP offline on Windows 10 and 11. You control quality, encoding method, and metadata handling — and batch the entire image library in one queue run with no upload.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Get File Converter Pro from the Microsoft Store. The free trial includes JPG to WebP encoding.' }
            @{ name = 'Add JPG images to the queue'; text = 'Drag JPG files or an entire image folder into the app. Mixed JPG and PNG files in the same queue are both converted to WebP.' }
            @{ name = 'Set WebP quality and encoding method'; text = 'Quality 80 matches typical JPG quality-85 visually but produces smaller files. Method 4-6 gives good size-to-speed balance. Lossless mode is available for graphics and UI elements.' }
            @{ name = 'Convert offline'; text = 'Click Convert. Output WebPs are saved to your chosen folder. Typical JPG → WebP at quality 80 is 2-4× faster than JPG → PNG encoding.' }
        )
        batchHtml = @'
                    <p>Migrating a product catalogue, a blog''s image library, or a portfolio archive from JPG to WebP is a batch operation. File Converter Pro handles this at any scale.</p>
                    <ul>
                        <li>Convert thousands of JPGs to WebP in a single queue run.</li>
                        <li>Mirror folder structure in output for drop-in replacement in web projects.</li>
                        <li>Mix JPG and PNG in the same batch — both output as WebP.</li>
                        <li>Strip EXIF metadata for privacy and smaller output files, or preserve it.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>WebP quality is on the same scale as JPEG quality but uses more efficient compression internally. For equivalent visual results you can use a lower quality number than JPEG:</p>
                    <ul>
                        <li><strong>Quality 80:</strong> roughly equivalent to JPEG quality 85. The standard recommendation for web delivery. 30-40 % smaller than the source JPG.</li>
                        <li><strong>Quality 90:</strong> near-lossless. For images where quality is paramount — product close-ups, portfolio pieces.</li>
                        <li><strong>Lossless WebP:</strong> perfect quality, no compression artefacts. Larger than lossy WebP but smaller than PNG. Use for UI elements, screenshots, and line art.</li>
                        <li><strong>Encoding method 0-6:</strong> higher methods compress better but take longer. Method 4 is the web standard balance.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Old Safari (pre-14) does not display WebP.</strong> Use the HTML picture element with a JPEG fallback. File Converter Pro can output both formats in one run for easy fallback setup.</li>
                        <li><strong>CMS upload form rejects WebP.</strong> Some platforms check file type by extension. Ensure your CMS whitelist includes .webp. WordPress supports WebP natively from version 5.8.</li>
                        <li><strong>WebP looks worse than the original JPG.</strong> You may have set quality too low. Try quality 80-85. Very low WebP quality produces blockier artefacts than JPEG at the same setting.</li>
                        <li><strong>Transparency not preserved from PNG sources.</strong> JPG sources have no transparency; PNG sources preserve alpha to WebP correctly. If you needed transparency, start from PNG rather than JPG.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/png-to-webp/'; label = 'Convert PNG to WebP (lossless to web-optimised)' }
            @{ href = '/en/convert/webp-to-jpg/'; label = 'Convert WebP to JPG (back to universal JPEG)' }
            @{ href = '/en/convert/webp-to-png/'; label = 'Convert WebP to PNG (lossless from WebP)' }
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (reduce PNG file size)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'How much smaller will my images be after converting JPG to WebP?'; a = 'On average 25-40 % smaller at equivalent visual quality. Results vary by image content — photographic images with fine detail see the biggest gains; flat-colour graphics see less.' }
            @{ q = 'Do all browsers support WebP?'; a = 'All modern browsers (Chrome, Edge, Firefox, Safari 14+) support WebP. Global support is above 96% as of 2025. Use a picture element with a JPG fallback for the remaining very old browsers.' }
            @{ q = 'Should I use lossy or lossless WebP for photos?'; a = 'Lossy WebP at quality 80-85 is best for photographs — it gives the best size reduction. Lossless WebP is better for UI elements, screenshots, and graphics with flat colours or sharp edges.' }
            @{ q = 'Can I convert an entire JPG image library to WebP in one batch?'; a = 'Yes. Drop the folder into File Converter Pro and it processes every JPG file in the queue. The original files are not modified — output WebPs are saved to a separate folder.' }
        )
        outputOptions = @(
            'Lossy WebP quality 1-100'
            'Lossless WebP mode'
            'Encoding method 0-6'
            'EXIF preserve or strip'
            'Transparency from PNG sources'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your JPG image library to WebP offline — 30-50% smaller files, no upload, no watermark, no size limit.'
    },

    @{
        slug = 'png-to-webp'
        from = 'PNG'
        to = 'WebP'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert PNG to WebP on Windows — Offline | File Converter Pro'
        desc = 'Convert PNG to WebP on Windows 10 and 11 offline. Preserve transparency, reduce file size 50-80% for the web. Batch processing, no upload. Try free.'
        h1 = 'Convert PNG to WebP on Windows — Smaller Files, Transparency Kept'
        heroSubtitle = 'Re-encode PNG images to WebP on Windows — preserve transparency, cut file size 50-80%, batch processing, fully offline.'
        whyHtml = @'
                    <p>PNG files are losslessly compressed but large. A typical PNG product image with a transparent background can be 500 KB to 2 MB. The equivalent lossless WebP is <strong>20-50 % smaller at the same pixel quality</strong>, and lossy WebP with transparency is often <strong>60-80 % smaller than PNG</strong> at visually indistinguishable quality.</p>
                    <p>The key advantage of WebP over JPEG for PNG sources is <strong>transparency support</strong>. JPG cannot store alpha channels, so PNG with transparency must stay as PNG for the web — or switch to WebP, which supports transparent backgrounds and achieves smaller file sizes than PNG for the same content.</p>
                    <p>For e-commerce sites with thousands of product images on white or transparent backgrounds, the performance impact of PNG → WebP migration is dramatic: page LCP times drop, Google PageSpeed scores rise, and CDN costs fall. All modern major browsers support WebP with transparent alpha channels natively.</p>
                    <p>File Converter Pro encodes PNG → WebP offline on Windows 10 and 11. Transparency is preserved automatically. There is no upload step, no per-file limit, and no watermark.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. The free trial includes PNG to WebP conversion with full transparency support.' }
            @{ name = 'Add PNG files to the queue'; text = 'Drag PNG images or an entire folder into the app. PNG files with and without transparency (alpha channels) are both handled correctly.' }
            @{ name = 'Choose lossy or lossless WebP'; text = 'Lossy WebP at quality 80-85 gives the best size savings for photos and product images. Lossless WebP (near-PNG quality, smaller than PNG) is best for UI elements and line art.' }
            @{ name = 'Convert offline'; text = 'Click Convert. Output WebPs are saved to your folder. Transparency is carried over to the WebP alpha channel automatically.' }
        )
        batchHtml = @'
                    <p>E-commerce catalogues, icon libraries, and UI design systems often have thousands of PNGs that all need WebP versions for modern web delivery. File Converter Pro handles these without any limits.</p>
                    <ul>
                        <li>Convert entire product image libraries in one batch job.</li>
                        <li>Transparency preserved in every file — perfect for product cutouts and logos.</li>
                        <li>Mirror folder structure on output for a drop-in replacement in your web project.</li>
                        <li>Run offline without internet access — safe for proprietary product assets.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>Lossless WebP:</strong> identical pixel quality to PNG, 20-30 % smaller. Ideal for UI elements, icons, and images where pixel-perfect quality matters.</li>
                        <li><strong>Lossy WebP quality 85:</strong> excellent visual quality, 50-70 % smaller than PNG for photographic content. The standard recommendation for product photos.</li>
                        <li><strong>Lossy WebP quality 75:</strong> web thumbnails and previews. Very compact, minor artefacts on close inspection.</li>
                        <li><strong>Alpha channel:</strong> preserved in both lossy and lossless WebP modes.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Transparency lost in output.</strong> Ensure you selected lossy or lossless WebP mode — both support alpha. JPG output would lose transparency; WebP should not.</li>
                        <li><strong>CMS does not accept .webp.</strong> Add .webp to your CMS allowed file types list. WordPress supports WebP natively since 5.8.</li>
                        <li><strong>Very small size savings for simple graphics.</strong> PNG-8 (palette-indexed) graphics are already small. WebP gains are most dramatic on PNG-24 photographic content and large illustrations.</li>
                        <li><strong>Old browsers show broken image.</strong> Use the picture HTML element to serve WebP to modern browsers and PNG as a fallback for IE11 and old Safari.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/jpg-to-webp/'; label = 'Convert JPG to WebP (JPEG to web-optimised)' }
            @{ href = '/en/convert/webp-to-png/'; label = 'Convert WebP to PNG (back to lossless)' }
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (reduce PNG file size)' }
            @{ href = '/en/convert/avif-to-png/'; label = 'Convert AVIF to PNG (next-gen to lossless)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'Does WebP support transparency like PNG does?'; a = 'Yes. Both lossy and lossless WebP support alpha channels (transparency). Your PNG transparent backgrounds and product cutouts carry over perfectly.' }
            @{ q = 'How much smaller will WebP be compared to PNG?'; a = 'Lossless WebP is typically 20-30% smaller than PNG. Lossy WebP at quality 80-85 is often 50-80% smaller than PNG for photographic content. Results vary by image type.' }
            @{ q = 'Should I keep PNG files as fallback for older browsers?'; a = 'For very old browsers (IE11, Safari pre-14) yes — use the HTML picture element with a PNG fallback. Most users (96%+) have WebP-capable browsers as of 2025.' }
            @{ q = 'Can I batch-convert an entire folder of PNG product images to WebP?'; a = 'Yes. Drop the folder into File Converter Pro and every PNG is converted and saved to your output folder. Filenames are preserved with .webp extension.' }
        )
        outputOptions = @(
            'Lossless WebP (near-PNG quality, 20-30% smaller)'
            'Lossy WebP quality 1-100'
            'Alpha channel preserved'
            'Encoding method 0-6'
            'EXIF strip or preserve'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your PNG images to WebP offline — transparency preserved, 50-80% smaller files, no upload, no watermark.'
    },

    @{
        slug = 'png-to-ico'
        from = 'PNG'
        to = 'ICO'
        catSlug = 'image-converter'
        catName = 'Image Converter'
        title = 'Convert PNG to ICO on Windows — Icon Maker | File Converter Pro'
        desc = 'Convert PNG to ICO on Windows 10 and 11 offline. Create Windows app icons with multiple sizes in one .ico file. No upload, no watermark. Try free.'
        h1 = 'Convert PNG to ICO on Windows — Multi-Size Icon Maker'
        heroSubtitle = 'Create Windows .ico icon files from PNG on your PC — embed multiple sizes (16, 32, 48, 64, 256 px), fully offline, free trial.'
        whyHtml = @'
                    <p>ICO is the native icon format for Windows applications, favours shortcuts, taskbar entries, and browser favicons. A proper .ico file is <strong>a container that embeds multiple image sizes</strong> — typically 16×16, 32×32, 48×48, 64×64, and 256×256 pixels — in a single file. Windows picks the correct size automatically depending on where the icon is displayed.</p>
                    <p>Developers building Windows desktop applications, creating shortcut icons, or setting up browser favicons start with a high-resolution PNG logo and need to generate a multi-size ICO from it. PNG is the ideal source — it is lossless, supports transparency, and scales cleanly in design tools.</p>
                    <p>Without a dedicated converter, making a proper multi-size ICO is unnecessarily complex: Paint cannot do it, the standard "Save As" in Photoshop requires a plugin, and most online converters only produce a single-size ICO (256×256) that looks blurry when Windows rescales it to 16×16 for the taskbar or title bar.</p>
                    <p>File Converter Pro generates a proper multi-size ICO with all required Windows sizes embedded in one .ico file — entirely offline on Windows 10 and 11, with no upload of your logo or brand assets.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial includes PNG to ICO conversion with multi-size embedding.' }
            @{ name = 'Add the source PNG'; text = 'Drag your logo or icon PNG into the app. Use a PNG of at least 256×256 pixels (512×512 or 1024×1024 is ideal) so all sizes are generated at maximum quality.' }
            @{ name = 'Select ICO output and choose sizes'; text = 'Pick ICO in the output panel. Select all standard sizes (16, 32, 48, 64, 256 px) to create a fully compatible Windows icon file. The app downsamples cleanly from the source PNG.' }
            @{ name = 'Convert and use your ICO'; text = 'Click Convert. The output .ico file is saved locally — no upload. Use it in Visual Studio, a .NET project, a shortcut properties dialog, or as a browser favicon.' }
        )
        batchHtml = @'
                    <p>Development teams often need ICO files for multiple app variants, feature flags, or theme variants from a set of PNG source icons. File Converter Pro processes these in batch.</p>
                    <ul>
                        <li>Convert a folder of PNGs to individual ICO files in one run.</li>
                        <li>Each ICO embeds all selected sizes automatically.</li>
                        <li>Source PNG filenames are preserved with .ico extension.</li>
                        <li>Works offline — suitable for build pipelines that cannot reach the internet.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>ICO quality depends on the source PNG resolution and the downsampling algorithm used for smaller sizes:</p>
                    <ul>
                        <li><strong>Source PNG ≥ 512×512:</strong> highly recommended. Downsampling from a large source produces sharp 16×16 and 32×32 sizes without visible softness.</li>
                        <li><strong>Lanczos resampling (default):</strong> the gold standard for high-quality icon downscaling. Sharp edges, accurate colours.</li>
                        <li><strong>Include 256×256 PNG size:</strong> the Windows Vista+ PNG-inside-ICO format for the large 256 px tile — supported by all modern Windows versions and provides the best quality at 256 px.</li>
                        <li><strong>Transparency:</strong> PNG alpha channels are preserved in all ICO sizes for proper icon transparency on any Windows background colour.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Icon looks blurry in taskbar.</strong> The ICO was only a 256×256 entry and Windows rescaled it down. Include all sizes (16, 32, 48) explicitly so Windows uses the correct bitmap rather than downscaling the large size at runtime.</li>
                        <li><strong>Transparency shows as black in some apps.</strong> The older BMP format inside ICO had a 1-bit mask. Use PNG-inside-ICO mode (enabled by default for 256 px) to get full alpha transparency at all sizes.</li>
                        <li><strong>Favicon not displaying in browser.</strong> Ensure the favicon.ico is in the site root (/) and the HTML <code>&lt;link rel="icon"&gt;</code> element points to it. Chrome caches favicons aggressively — clear the cache after updating.</li>
                        <li><strong>Visual Studio does not show the icon.</strong> Assign the ICO to the project in Project Properties → Application → Icon. The file must be in the project folder or referenced with an absolute path.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/png-to-jpg/'; label = 'Convert PNG to JPG (reduce image file size)' }
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (image to document)' }
            @{ href = '/en/convert/svg-to-png/'; label = 'Convert SVG to PNG (vector to raster icon source)' }
            @{ href = '/en/converters/image-converter/'; label = 'Browse all image conversions' }
        )
        faqs = @(
            @{ q = 'What sizes should a Windows ICO file contain?'; a = 'For maximum compatibility: 16×16, 32×32, 48×48, 64×64, and 256×256 pixels. Windows uses 16 px for the title bar and taskbar, 32 px for desktop shortcuts on standard DPI, 48 px on high DPI, and 256 px for large icons in Explorer.' }
            @{ q = 'What is the best source image size for creating an ICO?'; a = 'Use a PNG of at least 512×512 or 1024×1024 pixels. A larger source means higher-quality downsampling for small icon sizes. A 16×16 icon generated from a 512-px source looks sharper than one generated from a 32-px source.' }
            @{ q = 'Does the ICO file preserve transparency from the PNG?'; a = 'Yes. Transparency (alpha channel) is preserved in all ICO sizes, including the 256 px PNG-inside-ICO entry. Icons will display correctly on any Windows background colour.' }
            @{ q = 'Can I create a favicon.ico from a PNG logo?'; a = 'Yes. Convert your logo PNG to ICO and include 16×16, 32×32, and 48×48 sizes. Save as favicon.ico and place it in your website root. Most browsers will pick it up automatically.' }
        )
        outputOptions = @(
            '16, 32, 48, 64, 256 px embedded sizes'
            'PNG-inside-ICO for 256 px (default)'
            'Full alpha transparency'
            'Lanczos downsampling'
            'Single file or batch folder'
            'favicon.ico compatible output'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and create proper multi-size Windows ICO files from your PNG logos offline — no upload, no watermark, full transparency support.'
    }
)
