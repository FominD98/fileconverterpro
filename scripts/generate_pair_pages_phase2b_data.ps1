# Phase 2b data: PDF format pairs
# png-to-pdf, jpg-to-pdf, image-to-pdf, word-to-pdf,
# pdf-to-word, pdf-to-jpg, pdf-to-png, pdf-to-excel, pdf-to-pptx

$PairData = @(

    @{
        slug = 'png-to-pdf'
        from = 'PNG'
        to = 'PDF'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert PNG to PDF on Windows — Batch | File Converter Pro'
        desc = 'Convert PNG images to PDF on Windows 10 and 11 offline. Merge multiple PNGs into one PDF or one PDF per image. No upload, no watermark. Free trial.'
        h1 = 'Convert PNG to PDF on Windows — Offline &amp; Batch'
        heroSubtitle = 'Package PNG images into PDF documents on Windows — merge many PNGs into one PDF or one per image, fully offline, no upload, free trial.'
        whyHtml = @'
                    <p>PNG is the go-to format for screenshots, diagrams, infographics, and design exports. But when you need to <strong>share a set of images as a single portable document</strong> — a bug report with screenshots, a portfolio page, a product specification with diagrams — PDF is the right delivery format. Recipients get one file, page-ordered exactly as intended, that opens on any device without needing an image viewer.</p>
                    <p>Converting PNG to PDF is especially common for software developers (screenshot-based QA reports), designers (exporting Figma or Sketch pages to PDF for client review), and educators (packaging slide screenshots into a downloadable handout). The visual quality of lossless PNG is fully preserved inside the PDF when you choose lossless embedding.</p>
                    <p>There are two common merge modes: converting each PNG into its own single-page PDF (useful for archiving individual images with document metadata), and merging a batch of PNGs into one multi-page PDF (useful for presentation decks, report appendices, and portfolios). File Converter Pro supports both in the same session.</p>
                    <p>All conversion happens offline on your Windows 10 or 11 PC — no upload of your screenshots or design files to any third-party server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial supports PNG to PDF at full resolution.' }
            @{ name = 'Add PNG files to the queue'; text = 'Drag PNG images or a folder into the app. Set the order you want by dragging files in the queue — this becomes the page order in the merged PDF.' }
            @{ name = 'Choose merge mode and page settings'; text = 'Select "Merge all to one PDF" or "One PDF per image." Set page size (A4, Letter, or fit-to-image) and whether to centre images with white margins.' }
            @{ name = 'Convert offline'; text = 'Click Convert. The PDF is generated locally. A 20-screenshot QA report generates in seconds.' }
        )
        batchHtml = @'
                    <p>Screenshot-based documentation, design deliverables, and portfolio packages all involve converting many PNGs to a single PDF. File Converter Pro handles this without per-page limits.</p>
                    <ul>
                        <li>Merge hundreds of PNG screenshots into one PDF — no page cap.</li>
                        <li>Drag to reorder pages in the queue before converting.</li>
                        <li>Choose A4 / Letter or fit-to-image page sizing for each run.</li>
                        <li>No upload — design files and proprietary screenshots stay local.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>PNG images can be embedded in PDF in two ways:</p>
                    <ul>
                        <li><strong>Lossless (PNG data inside PDF):</strong> pixel-perfect quality, larger PDF. Use for architectural diagrams, technical screenshots, and design exports where precision matters.</li>
                        <li><strong>JPEG in PDF (quality 85-95):</strong> smaller file, slight lossy compression. Good for screenshots and photos where the PDF will be read on screen rather than printed.</li>
                        <li><strong>DPI options:</strong> preserve source DPI for accurate print sizing, or downsample to 96/150 DPI for screen-only PDFs with smaller file size.</li>
                        <li><strong>Transparency handling:</strong> transparent PNGs are composited on a white background in the PDF (PDF does not support page-level transparency).</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Images appear very small on the PDF page.</strong> Enable "fit to page" or "scale to fill" in the output settings. Default is to embed at the image''s actual pixel dimensions.</li>
                        <li><strong>Transparency shows as black.</strong> PDF pages do not support transparent backgrounds. Enable the "white background" option to correctly composite transparent PNGs.</li>
                        <li><strong>Large PDF file size.</strong> Switch from lossless to JPEG quality 85 embedding to reduce PDF size significantly while keeping text and screenshots readable.</li>
                        <li><strong>Wrong page order in merged PDF.</strong> Drag files in the queue to set page order before clicking Convert.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/jpg-to-pdf/'; label = 'Convert JPG to PDF (photos to document)' }
            @{ href = '/en/convert/image-to-pdf/'; label = 'Convert Images to PDF (any format to PDF)' }
            @{ href = '/en/convert/tiff-to-pdf/'; label = 'Convert TIFF to PDF (scans to document)' }
            @{ href = '/en/convert/heic-to-pdf/'; label = 'Convert HEIC to PDF (iPhone photos to document)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Can I merge multiple PNG files into one PDF?'; a = 'Yes. Add all your PNGs to the queue, set the order by dragging, choose "Merge all to one PDF" mode, and click Convert. All images become pages in a single PDF.' }
            @{ q = 'Will the PNG image quality be preserved in the PDF?'; a = 'With lossless embedding (the default), pixel quality is preserved exactly. If you choose JPEG embedding for smaller files, slight lossy compression is applied — use quality 90+ to keep it minimal.' }
            @{ q = 'Can I convert PNG to PDF without uploading my screenshots?'; a = 'Yes. File Converter Pro runs entirely locally on Windows. Your screenshots, design files, and proprietary images never leave your machine.' }
            @{ q = 'What page size does the PDF use?'; a = 'You can choose A4, US Letter, or "fit to image" (which makes each PDF page exactly the size of the source PNG in points at its source DPI). Fit-to-image is useful for screenshots.' }
        )
        outputOptions = @(
            'Merge all to one PDF or one per image'
            'Lossless or JPEG embedding'
            'A4 / Letter / fit-to-image pages'
            'Transparent PNG composited on white'
            'DPI preserve or downsample'
            'Drag-to-reorder page sequence'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your PNG images to PDF offline — merge any number of screenshots into one professional document, no upload, no watermark.'
    },

    @{
        slug = 'jpg-to-pdf'
        from = 'JPG'
        to = 'PDF'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert JPG to PDF on Windows — Offline | File Converter Pro'
        desc = 'Convert JPG photos to PDF on Windows 10 and 11 offline. Merge multiple JPEGs into one PDF or one file per image. No upload, no watermark. Free trial.'
        h1 = 'Convert JPG to PDF on Windows — Offline &amp; Batch'
        heroSubtitle = 'Turn JPG photos into PDF documents on Windows — one PDF per photo or merge all into one file, fully offline, no upload, free trial.'
        whyHtml = @'
                    <p>Photos exist as JPEGs; documents are expected as PDFs. Converting JPG to PDF bridges that gap — you can <strong>attach a single PDF instead of a dozen loose photos</strong>, ensure every recipient sees images in the exact order you intended, and deliver a professional document format for insurance claims, property reports, travel bookings, and compliance submissions.</p>
                    <p>JPG → PDF is one of the most commonly requested conversions in professional workflows. Photographers deliver proofs as multi-page PDFs. Field workers submit inspection photos as PDF reports. HR professionals attach scanned ID documents as PDFs. Event coordinators compile venue photos into PDF catalogues for clients.</p>
                    <p>The conversion preserves JPG image quality at the level you choose — for archival or print-quality PDF, embed at near-lossless quality; for compact email attachments, choose a more compressed embedding. Either way, the resulting PDF opens on any device with the images in the right sequence.</p>
                    <p>File Converter Pro does the conversion entirely offline on Windows 10 and 11. There is no upload step — critical for client photos, medical images, legal ID documents, and any other sensitive photography that should not pass through a third-party server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store and try it free. The trial supports JPG to PDF at full resolution.' }
            @{ name = 'Add JPG files and set page order'; text = 'Drag JPG photos into the app. Drag to reorder in the queue — the order you set is the page order in the PDF.' }
            @{ name = 'Choose single PDF or per-photo PDFs'; text = '"Merge all to one PDF" for a multi-page document; "One PDF per image" for individual PDFs per photo. Set page size (A4, Letter, or fit-to-image) and JPEG quality.' }
            @{ name = 'Convert offline'; text = 'Click Convert. The PDF is written locally on your PC. A 50-photo report finishes in under 30 seconds.' }
        )
        batchHtml = @'
                    <p>Job-site reports, property inspection logs, and insurance claim packages routinely involve 20-100 JPEGs that need to become one well-structured PDF. File Converter Pro handles these with no per-page limit.</p>
                    <ul>
                        <li>Merge any number of JPEGs into a single multi-page PDF.</li>
                        <li>Set page order by dragging in the queue before converting.</li>
                        <li>Batch individual PDFs for a folder of photos where each image is its own document.</li>
                        <li>No upload — sensitive client and insurance photos stay on your machine.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>JPG images are re-embedded in the PDF at a quality level you control:</p>
                    <ul>
                        <li><strong>Quality 95:</strong> near-lossless, best for print and legal documentation. Larger PDF files.</li>
                        <li><strong>Quality 85 (default):</strong> excellent on-screen quality, compact file size. Recommended for reports and email attachments.</li>
                        <li><strong>Quality 70:</strong> compact PDFs for quick sharing. Slight visual softness at very high zoom.</li>
                        <li><strong>DPI:</strong> 150 DPI for screen-only PDFs; 300 DPI for print-ready output.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Photos rotated incorrectly in PDF.</strong> File Converter Pro applies EXIF auto-rotation by default. Toggle this setting if photos are rotated the wrong way.</li>
                        <li><strong>PDF very large.</strong> Reduce JPEG quality to 70-80 in the embedding settings. A 30-photo PDF at quality 80 is typically under 15 MB.</li>
                        <li><strong>Wrong page order.</strong> Set order in the queue before converting — drag files up or down to reposition them.</li>
                        <li><strong>Image appears small on PDF page.</strong> Enable "fit to page" in settings to scale images to fill the A4 or Letter page.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (screenshots and diagrams to PDF)' }
            @{ href = '/en/convert/image-to-pdf/'; label = 'Convert Images to PDF (any image format to PDF)' }
            @{ href = '/en/convert/heic-to-pdf/'; label = 'Convert HEIC to PDF (iPhone photos to PDF)' }
            @{ href = '/en/convert/pdf-to-jpg/'; label = 'Convert PDF to JPG (extract pages as images)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Can I combine multiple JPG photos into one PDF file?'; a = 'Yes. Add all photos to the queue, drag to set page order, choose "Merge all to one PDF" mode, and click Convert. All JPEGs become pages of one PDF.' }
            @{ q = 'Is there a limit to how many JPGs I can merge into a PDF?'; a = 'No limit. File Converter Pro handles batches of hundreds of photos. Typical professional use cases (50-100 photos) complete in under a minute.' }
            @{ q = 'Will the photo quality be preserved in the PDF?'; a = 'At quality 85+ the embedding is near-original. Because JPG is already lossy, use quality 90+ for legal and medical documentation where image clarity is important.' }
            @{ q = 'Does the conversion work offline?'; a = 'Yes. Everything runs locally on your Windows PC. Your photos — insurance claims, ID documents, medical photos — never leave your machine.' }
        )
        outputOptions = @(
            'Merge all to one PDF or one per image'
            'JPEG quality 70-95 in PDF'
            'A4 / Letter / fit-to-image pages'
            'EXIF auto-rotation'
            '150 / 300 DPI output'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your JPG photos to professional PDF documents offline — merge unlimited photos, no upload, no watermark, free trial.'
    },

    @{
        slug = 'image-to-pdf'
        from = 'Image'
        to = 'PDF'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert Images to PDF on Windows — Batch | File Converter Pro'
        desc = 'Convert JPG, PNG, HEIC, TIFF and more to PDF on Windows 10 and 11 offline. Merge any image format into one PDF. No upload, no size limit. Free trial.'
        h1 = 'Convert Images to PDF on Windows — Any Format, Offline'
        heroSubtitle = 'Merge JPG, PNG, HEIC, TIFF, WebP and more into one PDF on Windows — batch processing, fully offline, no upload, free trial.'
        whyHtml = @'
                    <p>Real-world document workflows rarely involve a single image format. A typical insurance claim might include HEIC photos from an iPhone, PNG screenshots from a computer, and TIFF scans from a flatbed scanner — all of which need to be <strong>packaged into one consolidated PDF for submission</strong>. Handling mixed image formats in a single batch is exactly what File Converter Pro''s image-to-PDF merge mode is built for.</p>
                    <p>Converting images to PDF is useful across every professional domain: architects submit site-photo packages as PDF appendices, HR managers convert scanned ID documents and selfie photos together, insurance adjusters bundle damage photos of different formats, and consultants package their research screenshots alongside TIFF exports from specialized tools.</p>
                    <p>The alternative — converting each format separately, then combining PDFs — is a multi-step process that introduces unnecessary friction and potential quality loss from intermediate conversions. File Converter Pro handles JPG, JPEG, PNG, HEIC, TIFF, BMP, WebP, AVIF, and more in a single conversion pass, preserving each image at the quality level you specify.</p>
                    <p>All conversion runs offline on your Windows 10 or 11 machine. Mixed batches of sensitive personal and business images never leave your local environment.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Get File Converter Pro from the Microsoft Store. The free trial includes multi-format image to PDF conversion.' }
            @{ name = 'Add mixed image files to the queue'; text = 'Drag images of any supported format into the app — JPG, PNG, HEIC, TIFF, BMP, WebP, AVIF. Mix and match freely. The app handles each format automatically.' }
            @{ name = 'Set merge mode and page layout'; text = 'Choose "Merge all to one PDF" for one combined document. Set page size (A4, Letter, or fit-to-image) and the JPEG quality for image embedding.' }
            @{ name = 'Convert offline'; text = 'Click Convert. Each image is decoded from its source format and embedded in the PDF in the queue order you set. Output is local — no upload.' }
        )
        batchHtml = @'
                    <p>Mixed-format image batches are the norm in professional document workflows. File Converter Pro processes all supported formats in one job without manual preprocessing.</p>
                    <ul>
                        <li>JPG, PNG, HEIC, TIFF, BMP, WebP, AVIF all accepted in the same queue.</li>
                        <li>No per-image or per-page limits — batches of hundreds of images work fine.</li>
                        <li>Drag to reorder the queue to control page sequence in the merged PDF.</li>
                        <li>Works offline — suitable for legal, medical, and government document workflows.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>Images are embedded in the PDF at a quality you set:</p>
                    <ul>
                        <li><strong>Lossless embedding for PNG/TIFF/BMP:</strong> pixel-perfect, larger PDF. Best for technical screenshots and diagrams.</li>
                        <li><strong>JPEG embedding quality 90:</strong> near-lossless for photos, significantly smaller PDF.</li>
                        <li><strong>JPEG embedding quality 80 (default for mixed batches):</strong> good balance for multi-format PDFs containing a mix of photos and diagrams.</li>
                        <li><strong>DPI setting:</strong> 150 DPI for screen PDFs, 300 DPI for print or archival use.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>HEIC files not converting.</strong> Ensure the app is up to date. If HEIC decoding fails, pre-convert HEIC to JPG first using the HEIC to JPG conversion mode, then add the JPGs to the image-to-PDF batch.</li>
                        <li><strong>Mixed page orientations in PDF.</strong> Landscape-oriented photos become landscape pages; portrait images become portrait pages in fit-to-image mode. Use fixed A4/Letter to normalise all pages to the same orientation.</li>
                        <li><strong>Very large PDF output.</strong> Choose JPEG quality 75-80 for a balanced size-quality trade-off in mixed-format batches.</li>
                        <li><strong>Page order not matching file names.</strong> Alphabetical sort is the default. Drag files in the queue to set the exact page sequence you need.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/jpg-to-pdf/'; label = 'Convert JPG to PDF (photos to PDF)' }
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (screenshots to PDF)' }
            @{ href = '/en/convert/heic-to-pdf/'; label = 'Convert HEIC to PDF (iPhone photos to PDF)' }
            @{ href = '/en/convert/tiff-to-pdf/'; label = 'Convert TIFF to PDF (scans to PDF)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Which image formats can I convert to PDF?'; a = 'File Converter Pro supports JPG, JPEG, PNG, HEIC, TIFF, BMP, WebP, AVIF, and more. Mix any of these formats in the same batch queue and they all convert to PDF in one run.' }
            @{ q = 'Can I merge images of different formats into one PDF?'; a = 'Yes. Add JPGs, PNGs, HEICs, and TIFFs to the same queue, arrange the order, and choose "Merge all to one PDF." The app handles each format automatically.' }
            @{ q = 'Is there a page limit for the merged PDF?'; a = 'No. File Converter Pro does not impose per-page limits. Large batches of hundreds of images merge into one PDF without issue.' }
            @{ q = 'Does image-to-PDF conversion work offline?'; a = 'Yes. Everything runs locally on your Windows 10 or 11 PC. No images are uploaded to any server.' }
        )
        outputOptions = @(
            'JPG, PNG, HEIC, TIFF, BMP, WebP, AVIF input'
            'Merge all to one PDF or one per image'
            'A4 / Letter / fit-to-image pages'
            'Lossless or JPEG embedding'
            'EXIF auto-rotation'
            'Drag-to-reorder page sequence'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and merge any combination of image formats into a professional PDF offline — no upload, no watermark, no page limits, free trial.'
    },

    @{
        slug = 'word-to-pdf'
        from = 'Word'
        to = 'PDF'
        catSlug = 'document-converter'
        catName = 'Document Converter'
        title = 'Convert Word to PDF on Windows — Offline | File Converter Pro'
        desc = 'Convert DOCX and DOC to PDF on Windows 10 and 11 offline. Batch-convert Word documents with no upload, no watermark, no Microsoft 365 subscription needed.'
        h1 = 'Convert Word to PDF on Windows — Offline &amp; Batch'
        heroSubtitle = 'Export DOCX and DOC files to PDF on Windows without Microsoft 365 — fully offline, batch processing, no upload, free trial.'
        whyHtml = @'
                    <p>PDF is the universal delivery format for documents. Converting Word files to PDF ensures that <strong>the layout, fonts, and formatting look exactly as designed</strong> regardless of what software the recipient uses. Word documents can reflow, change fonts, or shift page breaks when opened in a different version of Word or in LibreOffice. PDFs render identically everywhere.</p>
                    <p>Word to PDF conversion is a core workflow requirement for: sending contracts, proposals, and reports to clients who do not have Microsoft Office; submitting documents to portals and government systems that require PDF; archiving final document versions with layout locked; and batch-exporting a whole document library into a format-stable archive.</p>
                    <p>Traditionally, the only way to convert DOCX to PDF on Windows was to have Microsoft Word installed and use its "Export to PDF" function. File Converter Pro provides an offline alternative that does not require Microsoft Office or a 365 subscription — making it useful for machines where Office is not installed, or for batch-processing documents in automated workflows where opening Word interactively is impractical.</p>
                    <p>Conversion happens entirely locally on your Windows 10 or 11 PC. Business documents, legal contracts, and sensitive personal records never leave your machine.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download File Converter Pro from the Microsoft Store. The free trial supports DOCX and DOC to PDF conversion.' }
            @{ name = 'Add Word documents to the queue'; text = 'Drag .docx or .doc files into the app. You can also drop an entire folder to batch-convert a whole document library.' }
            @{ name = 'Select PDF output settings'; text = 'Choose PDF. Optionally set PDF/A mode for archival-compliant output. The default settings produce a high-fidelity PDF that renders the document layout accurately.' }
            @{ name = 'Convert offline'; text = 'Click Convert. PDFs are generated locally with no upload. A 10-page DOCX typically converts in under two seconds.' }
        )
        batchHtml = @'
                    <p>Document management workflows often require converting large volumes of DOCX files to PDF — year-end report archives, contract repositories, policy document libraries. File Converter Pro handles these batches without per-file limits.</p>
                    <ul>
                        <li>Convert hundreds of DOCX files in a single queue run.</li>
                        <li>Preserve the source folder structure in the output directory.</li>
                        <li>No Microsoft Office required on the machine running the conversion.</li>
                        <li>Output PDFs keep the source filename with .pdf extension.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>Word to PDF output quality options in File Converter Pro:</p>
                    <ul>
                        <li><strong>Standard PDF:</strong> high-fidelity rendering of text, tables, images, headers/footers, and styles. Best for general distribution.</li>
                        <li><strong>PDF/A-1b:</strong> archival-compliant format for long-term document preservation. Required by many government and legal archives.</li>
                        <li><strong>Image compression in PDF:</strong> embedded images in the DOCX are re-compressed at the quality level you choose — 85 is the default balance.</li>
                        <li><strong>Hyperlinks:</strong> hyperlinks in the DOCX are preserved as clickable links in the PDF output.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Fonts look different in the PDF.</strong> The DOCX uses a font not available on the conversion machine. File Converter Pro embeds fonts where possible. For best results, ensure the fonts used in the document are installed on Windows.</li>
                        <li><strong>Page layout shifts in PDF.</strong> Complex multi-column layouts or embedded Word objects may not render perfectly without Microsoft Word''s layout engine. For documents with complex formatting, use Word''s own Export to PDF if available.</li>
                        <li><strong>Images blurry in PDF.</strong> Embedded images in the DOCX were low-resolution. The converter faithfully reproduces what is in the source document.</li>
                        <li><strong>Tables extend off the page.</strong> The source DOCX had tables wider than the printable area. Adjust table widths in Word before converting, or reduce PDF page margins.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/pdf-to-word/'; label = 'Convert PDF to Word (back to editable DOCX)' }
            @{ href = '/en/convert/jpg-to-pdf/'; label = 'Convert JPG to PDF (photos to document)' }
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (images to document)' }
            @{ href = '/en/converters/document-converter/'; label = 'Browse all document conversions' }
        )
        faqs = @(
            @{ q = 'Do I need Microsoft Word installed to convert DOCX to PDF?'; a = 'No. File Converter Pro includes its own document rendering engine and does not require Microsoft Office or a Microsoft 365 subscription. It works on a clean Windows 10 or 11 installation.' }
            @{ q = 'Will the PDF look the same as the Word document?'; a = 'For standard documents (paragraphs, tables, images, headers) the rendering is accurate. Highly complex Word documents with advanced formatting may have minor layout differences without Microsoft Word''s native layout engine.' }
            @{ q = 'Can I batch-convert an entire folder of DOCX files to PDF?'; a = 'Yes. Drag the folder into File Converter Pro and every DOCX and DOC file in it is converted to PDF in one run. Output PDFs are saved to your specified folder.' }
            @{ q = 'Is the conversion completely offline?'; a = 'Yes. Everything runs locally on your Windows PC. Business documents and contracts never leave your machine.' }
        )
        outputOptions = @(
            'Standard PDF output'
            'PDF/A-1b archival mode'
            'Hyperlinks preserved'
            'Embedded image quality control'
            'Batch folder processing'
            'No Microsoft Office required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your Word documents to PDF offline — no Office subscription needed, no upload, no watermark, batch processing included.'
    },

    @{
        slug = 'pdf-to-word'
        from = 'PDF'
        to = 'Word'
        catSlug = 'document-converter'
        catName = 'Document Converter'
        title = 'Convert PDF to Word on Windows — Offline | File Converter Pro'
        desc = 'Convert PDF to editable Word DOCX on Windows 10 and 11 offline. Batch extract text and layout from PDFs. No upload, no watermark, no subscription. Try free.'
        h1 = 'Convert PDF to Word on Windows — Offline &amp; Editable'
        heroSubtitle = 'Extract PDF content into editable Word DOCX on Windows — offline, batch processing, no upload, no Microsoft 365 needed, free trial.'
        whyHtml = @'
                    <p>PDFs are designed for fixed-layout display, not editing. When you need to <strong>edit, reformat, or repurpose content from a PDF</strong> — extract tables into Excel, update a contract clause, rebuild a brochure in Word — you need the PDF converted back to an editable format. DOCX is the universal editable document format that Microsoft Word, LibreOffice, Google Docs, and every modern word processor reads.</p>
                    <p>Common PDF to Word scenarios include: editing scanned contracts that were PDF-archived but need updating; extracting report content for a slide deck; pulling form fields from government PDFs; and rebuilding newsletter content from PDF archives for web publishing. In each case, re-typing the content manually is the painful alternative.</p>
                    <p>PDF to Word conversion quality depends heavily on the source PDF. Text-based PDFs (where the text is searchable in Adobe Reader) convert accurately, preserving paragraphs, headings, tables, and lists. Scanned PDFs (images of pages) require OCR (Optical Character Recognition) to extract text — File Converter Pro includes OCR for scanned documents.</p>
                    <p>The conversion runs entirely offline on your Windows 10 or 11 machine. Business and legal documents never need to be uploaded to a third-party server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. The free trial includes PDF to DOCX conversion. No Microsoft Office subscription required.' }
            @{ name = 'Add PDF files to the queue'; text = 'Drag one or more PDF files or a folder into the app. Both text-based and scanned-image PDFs are accepted.' }
            @{ name = 'Select Word (DOCX) as output'; text = 'Pick DOCX in the output panel. Enable OCR for scanned PDFs. For text-based PDFs, OCR is not needed and the conversion is faster and more accurate.' }
            @{ name = 'Convert offline'; text = 'Click Convert. DOCX files are generated locally. A 10-page text PDF converts in a few seconds; a scanned document with OCR takes 15-30 seconds per page.' }
        )
        batchHtml = @'
                    <p>Digitisation and content migration projects often require converting large numbers of legacy PDFs to editable DOCX. File Converter Pro handles these batches without limits.</p>
                    <ul>
                        <li>Batch-convert entire folders of PDFs to DOCX in one run.</li>
                        <li>Separate processing modes for text PDFs (fast) and scanned PDFs (OCR).</li>
                        <li>Output DOCX files retain source filenames with .docx extension.</li>
                        <li>Works offline on isolated networks — suitable for sensitive legal and financial documents.</li>
                    </ul>
'@
        qualityHtml = @'
                    <p>PDF to Word conversion quality varies by document type:</p>
                    <ul>
                        <li><strong>Text-based PDFs:</strong> high accuracy. Text, paragraphs, headings, tables, and bullet lists convert cleanly. Complex multi-column layouts may need minor manual cleanup.</li>
                        <li><strong>Scanned PDFs with OCR:</strong> accuracy depends on scan quality (300 DPI or higher gives best results) and font clarity. Handwritten text is not reliably recognised by OCR.</li>
                        <li><strong>Image-heavy PDFs:</strong> images are extracted and placed in the DOCX. Complex graphic layouts may need repositioning.</li>
                        <li><strong>Tables:</strong> simple tables convert accurately to Word tables. Merged-cell and nested table structures may need manual adjustment after conversion.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Text garbled or missing.</strong> The PDF may use embedded custom fonts that the converter cannot decode. Try enabling OCR mode, which reads the rendered image of the page instead of the encoded text stream.</li>
                        <li><strong>Scanned PDF converts to blank DOCX.</strong> OCR is not enabled. Go to output settings and enable OCR for scanned or image-based PDFs.</li>
                        <li><strong>Layout looks different in Word.</strong> PDF uses absolute positioning; Word uses flowing layout. Complex two-column and sidebar layouts always require post-conversion cleanup in Word.</li>
                        <li><strong>Tables not preserved.</strong> Complex PDF tables with merged cells are difficult to extract perfectly. Simple tables convert accurately; complex tables may need rebuilding in Word.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/word-to-pdf/'; label = 'Convert Word to PDF (back to locked PDF)' }
            @{ href = '/en/convert/pdf-to-excel/'; label = 'Convert PDF to Excel (extract tables to spreadsheet)' }
            @{ href = '/en/convert/pdf-to-jpg/'; label = 'Convert PDF to JPG (extract pages as images)' }
            @{ href = '/en/converters/document-converter/'; label = 'Browse all document conversions' }
        )
        faqs = @(
            @{ q = 'Can File Converter Pro convert scanned PDF to Word?'; a = 'Yes. Enable OCR (Optical Character Recognition) in the output settings for scanned PDFs. OCR reads the image of each page and converts it to editable text. For best accuracy, use PDFs scanned at 300 DPI or higher.' }
            @{ q = 'How accurate is PDF to Word conversion?'; a = 'For text-based PDFs, accuracy is high — paragraphs, headings, tables, and lists convert well. Complex multi-column layouts may need minor cleanup. Scanned PDFs depend on scan quality.' }
            @{ q = 'Do I need Microsoft Word installed for the conversion?'; a = 'No. File Converter Pro generates the DOCX file without requiring Microsoft Office. The output DOCX opens in Word, LibreOffice, and Google Docs.' }
            @{ q = 'Does PDF to Word conversion work offline?'; a = 'Yes. The conversion runs entirely on your Windows 10 or 11 PC. Your documents are not uploaded to any server.' }
        )
        outputOptions = @(
            'DOCX output (Word 2007+)'
            'OCR for scanned PDFs'
            'Text, tables, and images extracted'
            'Batch folder processing'
            'No Microsoft Office required'
            'Offline, no upload'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your PDFs to editable Word DOCX offline — OCR included for scanned documents, no upload, no watermark, free trial.'
    },

    @{
        slug = 'pdf-to-jpg'
        from = 'PDF'
        to = 'JPG'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert PDF to JPG on Windows — Offline | File Converter Pro'
        desc = 'Convert PDF pages to JPG images on Windows 10 and 11 offline. Extract all pages as high-res JPEGs in batch. No upload, no watermark, no size limit. Try free.'
        h1 = 'Convert PDF to JPG on Windows — Extract Pages as Images'
        heroSubtitle = 'Export every PDF page as a JPG image on Windows — high-resolution, batch processing, fully offline, no upload, free trial.'
        whyHtml = @'
                    <p>Extracting PDF pages as JPG images is a common need: embedding a PDF slide in a web page, inserting a specific PDF page into a PowerPoint presentation, generating preview thumbnails for a document management system, or simply sharing a particular page from a report as an image in a chat or email. <strong>PDF to JPG makes individual pages accessible as standalone image files</strong> that any viewer can open and embed without a PDF reader.</p>
                    <p>Marketers converting PDF brochures to web images, developers generating preview thumbnails for document libraries, and students extracting specific figures from academic PDFs all rely on this conversion. Each extracted page becomes a full-resolution JPEG at the DPI you specify — typically 150 DPI for screen use or 300 DPI for print-quality extracts.</p>
                    <p>File Converter Pro extracts all pages of a PDF as individual JPGs, or lets you specify a page range. Batch mode processes an entire folder of PDFs, producing one subfolder of JPGs per PDF — a clean, organised output structure.</p>
                    <p>All extraction runs locally on your Windows 10 or 11 PC. No upload of your business PDFs, legal documents, or confidential reports to any third-party server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. The free trial includes PDF to JPG page extraction.' }
            @{ name = 'Add PDF files to the queue'; text = 'Drag one PDF or multiple PDFs into the app. The app shows the page count of each file in the queue.' }
            @{ name = 'Set DPI and quality'; text = 'Choose output DPI (150 for screen, 300 for print). Set JPEG quality 85-95 for crisp text and sharp images. Specify a page range if you only need specific pages.' }
            @{ name = 'Extract offline'; text = 'Click Convert. Each PDF page is saved as a numbered JPG (page-001.jpg, page-002.jpg, ...) in a folder named after the source PDF.' }
        )
        batchHtml = @'
                    <p>Processing multiple PDFs at once and extracting all their pages as images is a common production task for document management and content pipelines.</p>
                    <ul>
                        <li>Process an entire folder of PDFs in one run — each produces its own subfolder of JPGs.</li>
                        <li>Consistent naming: page-001.jpg, page-002.jpg across all conversions.</li>
                        <li>Set DPI and quality once for the entire batch.</li>
                        <li>No per-page or per-file limits — 500-page PDFs are handled.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>150 DPI / quality 85:</strong> excellent for screen display, web thumbnails, and social sharing. Compact file size.</li>
                        <li><strong>300 DPI / quality 90:</strong> print-quality extraction. Sharp text, detailed graphics. Larger files.</li>
                        <li><strong>72 DPI / quality 80:</strong> small web previews and thumbnails. Fast to generate and deliver.</li>
                        <li><strong>Note on text sharpness:</strong> rendered text quality in JPGs depends on DPI — use 200+ DPI for readable fine print and technical diagrams.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Text in images appears blurry.</strong> Increase DPI to 200-300. At 72 or 96 DPI, text in small fonts becomes unreadable. 150 DPI is the minimum recommended for document pages.</li>
                        <li><strong>Output is blank pages.</strong> The PDF may have scanned images on a white background — this is the correct content. If pages should have text, the PDF may be encrypted or use unusual rendering.</li>
                        <li><strong>Page order wrong.</strong> Pages are always extracted in PDF page order. If you need a different sequence, extract first then rename/sort the files.</li>
                        <li><strong>Encrypted PDF fails to open.</strong> Password-protected PDFs require the password before extraction. Enter the password in the PDF settings before converting.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/pdf-to-png/'; label = 'Convert PDF to PNG (lossless page extraction)' }
            @{ href = '/en/convert/jpg-to-pdf/'; label = 'Convert JPG to PDF (images back to document)' }
            @{ href = '/en/convert/pdf-to-word/'; label = 'Convert PDF to Word (editable text extraction)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Can I extract just specific pages from a PDF as JPG?'; a = 'Yes. Enter a page range (e.g., 3-7 or 1,4,9) in the output settings and only those pages are extracted as JPG files.' }
            @{ q = 'What DPI should I use for PDF to JPG conversion?'; a = '150 DPI for web and screen use. 300 DPI for print-quality output or when text needs to be very readable. 72 DPI for small thumbnails only.' }
            @{ q = 'Can I batch-convert multiple PDFs to JPG?'; a = 'Yes. Add all PDFs to the queue and all pages from every PDF are extracted as JPGs, organised in subfolders per source PDF.' }
            @{ q = 'Is the extraction offline?'; a = 'Yes. File Converter Pro runs entirely on your Windows PC. Your PDFs are never uploaded to any server.' }
        )
        outputOptions = @(
            'JPG quality 70-95'
            '72 / 96 / 150 / 200 / 300 DPI'
            'Page range selection'
            'One subfolder per PDF in batch mode'
            'Consistent page numbering in filenames'
            'No upload, fully offline'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and extract PDF pages as high-resolution JPGs offline — batch any number of PDFs, no upload, no watermark, free trial.'
    },

    @{
        slug = 'pdf-to-png'
        from = 'PDF'
        to = 'PNG'
        catSlug = 'pdf-converter'
        catName = 'PDF Converter'
        title = 'Convert PDF to PNG on Windows — Offline | File Converter Pro'
        desc = 'Convert PDF pages to lossless PNG images on Windows 10 and 11 offline. Extract all pages at 300 DPI. No upload, no watermark, no size limit. Try free.'
        h1 = 'Convert PDF to PNG on Windows — Lossless Page Extraction'
        heroSubtitle = 'Export PDF pages as lossless PNG images on Windows — high DPI, transparency support, batch processing, fully offline, free trial.'
        whyHtml = @'
                    <p>When you need PDF pages as images with <strong>pixel-perfect quality and no compression artefacts</strong>, PNG is the right output format. Unlike JPG, PNG uses lossless compression — fine text, sharp diagrams, and crisp graphics are reproduced without the blocky artefacts that JPEG compression can introduce at page boundaries and text edges.</p>
                    <p>PDF to PNG is used in professional publishing workflows where extracted page images are used as source material for further editing or compositing. A print layout extracted as PNG can be opened in Photoshop or Illustrator as a clean reference without JPEG degradation affecting fine details. Legal document pages exported as PNG are used as exhibits where text clarity must be beyond question.</p>
                    <p>PNG also supports transparent backgrounds — useful when extracting PDF content that will be placed over a coloured background in a presentation or web page. File Converter Pro can export PDF pages with or without background transparency depending on the source document.</p>
                    <p>All extraction runs locally on Windows 10 and 11. No upload of confidential PDFs to any third-party server.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Get File Converter Pro from the Microsoft Store. Free trial includes PDF to PNG page extraction.' }
            @{ name = 'Add PDF files to the queue'; text = 'Drag PDFs into the app. The queue shows page count for each file.' }
            @{ name = 'Set DPI and page range'; text = 'Choose 150 DPI for screen output or 300 DPI for print-quality lossless PNGs. Enter a page range if you only need specific pages.' }
            @{ name = 'Extract offline'; text = 'Click Convert. Each page becomes a numbered PNG file in a folder named after the source PDF.' }
        )
        batchHtml = @'
                    <p>Publishing and documentation workflows that need PNG versions of PDF pages can batch-process entire libraries of PDFs with File Converter Pro.</p>
                    <ul>
                        <li>Process folders of PDFs in one run — each generates its own subfolder of PNGs.</li>
                        <li>Consistent naming across all output files (page-001.png, page-002.png).</li>
                        <li>DPI and quality settings apply uniformly across the batch.</li>
                        <li>Large PDFs (100+ pages) are handled without interruption.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>300 DPI:</strong> recommended for detailed diagrams, technical drawings, and text-heavy pages that need to remain sharp at full resolution.</li>
                        <li><strong>150 DPI:</strong> balanced for web use and screen display. PNG files are large at 300 DPI; 150 DPI gives good quality at a more manageable file size.</li>
                        <li><strong>PNG-24 (default):</strong> full-colour lossless output. Correct for all photographic and mixed content PDFs.</li>
                        <li><strong>PNG-8:</strong> 256-colour palette. Only for very simple diagrams with flat colours — not appropriate for photographic PDF content.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>PNG files very large.</strong> PNG is lossless — a 300 DPI A4 page PNG can be 5-20 MB. Use 150 DPI for screen use, or switch to JPG output if file size is a priority over losslessness.</li>
                        <li><strong>Text still slightly soft at 150 DPI.</strong> For crisp fine text (footnotes, legal references), use 200-300 DPI.</li>
                        <li><strong>White background instead of transparency.</strong> Enable transparent background extraction in settings if you need the page content without a white fill (only effective for PDFs that do not have a solid white background drawn in the PDF itself).</li>
                        <li><strong>Encrypted PDF not extracting.</strong> Enter the PDF password in the settings before extracting pages.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/pdf-to-jpg/'; label = 'Convert PDF to JPG (smaller image files)' }
            @{ href = '/en/convert/png-to-pdf/'; label = 'Convert PNG to PDF (PNGs back to document)' }
            @{ href = '/en/convert/pdf-to-word/'; label = 'Convert PDF to Word (editable text)' }
            @{ href = '/en/converters/pdf-converter/'; label = 'Browse all PDF conversions' }
        )
        faqs = @(
            @{ q = 'Why use PNG instead of JPG for PDF extraction?'; a = 'PNG is lossless — text edges, thin lines, and fine details are reproduced without compression artefacts. Use PNG when quality is non-negotiable: legal exhibits, technical diagrams, and images for further editing.' }
            @{ q = 'What DPI is best for PDF to PNG?'; a = '300 DPI for print-quality output and sharp text. 150 DPI for screen display and web use. Anything below 100 DPI will have unreadably soft text.' }
            @{ q = 'Can I convert only specific pages of a PDF?'; a = 'Yes. Enter a page range in the output settings (e.g., 2-5 or 1,3,7) to extract only the pages you need.' }
            @{ q = 'Is PDF to PNG conversion offline?'; a = 'Yes. Extraction runs locally on your Windows PC. Your PDFs are not uploaded anywhere.' }
        )
        outputOptions = @(
            'PNG-24 lossless output'
            '72 / 96 / 150 / 200 / 300 DPI'
            'Page range selection'
            'One subfolder per PDF in batch mode'
            'Transparent background option'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and extract your PDF pages as lossless PNG images offline — 300 DPI quality, no upload, no watermark, free trial.'
    },

    @{
        slug = 'pdf-to-excel'
        from = 'PDF'
        to = 'Excel'
        catSlug = 'document-converter'
        catName = 'Document Converter'
        title = 'Convert PDF to Excel on Windows — Offline | File Converter Pro'
        desc = 'Convert PDF tables to Excel XLSX on Windows 10 and 11 offline. Extract tabular data from PDF reports without upload, no watermark, no subscription. Try free.'
        h1 = 'Convert PDF to Excel on Windows — Extract Tables Offline'
        heroSubtitle = 'Extract PDF tables and data into Excel XLSX on Windows — offline, no upload, no Microsoft 365 subscription required, free trial.'
        whyHtml = @'
                    <p>PDF reports, financial statements, and data exports lock tabular data inside a fixed-layout format that Excel cannot directly open. <strong>Converting PDF to Excel extracts tables into editable, calculable spreadsheet cells</strong> — turning a static PDF balance sheet into a live Excel model, or a PDF price list into a sortable, filterable table.</p>
                    <p>Finance professionals converting bank statements, accountants processing supplier invoices, analysts working with government statistical PDFs, and operations teams extracting data from legacy system reports all depend on this conversion daily. Re-typing data from a PDF into Excel manually is time-consuming and error-prone; automated PDF to Excel extraction is the professional solution.</p>
                    <p>The quality of PDF to Excel conversion depends on the source. Text-based PDFs with clean tabular structure (lines between cells, consistent column spacing) convert with high accuracy. Scanned PDF tables require OCR — File Converter Pro includes OCR to handle scanned financial documents and legacy reports.</p>
                    <p>The conversion runs entirely offline on your Windows 10 or 11 machine. Financial documents and business data never leave your local environment.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes PDF to XLSX conversion. No Microsoft Excel required for conversion (only for opening the output).' }
            @{ name = 'Add PDF files with tables to the queue'; text = 'Drag PDFs containing tables or data into the app. Both text-based PDFs and scanned PDFs (with OCR enabled) are supported.' }
            @{ name = 'Select Excel (XLSX) output and enable OCR if needed'; text = 'Choose XLSX as output. Enable OCR for scanned or image-based PDFs. Set the table extraction mode — auto-detect works for most standard report formats.' }
            @{ name = 'Convert offline'; text = 'Click Convert. XLSX files are generated locally. Each table in the PDF becomes a worksheet in the Excel file.' }
        )
        batchHtml = @'
                    <p>Monthly report processing, statement reconciliation, and data migration projects often involve batches of PDFs that all need tabular data extracted. File Converter Pro processes these in one run.</p>
                    <ul>
                        <li>Batch-convert a folder of PDF reports to XLSX in one queue run.</li>
                        <li>Each PDF produces one XLSX with tables in separate worksheets.</li>
                        <li>OCR handles scanned statements and legacy PDFs automatically when enabled.</li>
                        <li>Works offline — financial data stays on your machine.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>Text-based PDFs:</strong> high accuracy for tables with clear structure. Column alignment and data types (numbers, dates, text) are detected automatically.</li>
                        <li><strong>Scanned PDFs with OCR:</strong> accuracy depends on scan quality. 300 DPI scans produce significantly better OCR results than 150 DPI.</li>
                        <li><strong>Multi-table PDFs:</strong> each table in a PDF is extracted to a separate worksheet, keeping data organised by source table.</li>
                        <li><strong>Number formats:</strong> decimal separators, currency symbols, and date formats are preserved where detectable.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Data in wrong columns.</strong> PDF tables that use whitespace (not lines) for column separation can be ambiguous. Adjust the "column detection sensitivity" setting or manually assign columns after extraction.</li>
                        <li><strong>Scanned PDF extracts to empty Excel.</strong> OCR is not enabled. Turn on OCR in the output settings for scanned or image-based PDFs.</li>
                        <li><strong>Numbers extracted as text.</strong> Some PDF number formats are not recognised. Manually convert the column to Number format in Excel after extraction using Data → Text to Columns.</li>
                        <li><strong>Merged cells not preserved.</strong> PDF does not use the same cell structure as Excel. Merged cells in the PDF become separate cells in the XLSX; merge them manually in Excel if needed.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/pdf-to-word/'; label = 'Convert PDF to Word (text and paragraphs)' }
            @{ href = '/en/convert/pdf-to-jpg/'; label = 'Convert PDF to JPG (pages as images)' }
            @{ href = '/en/convert/word-to-pdf/'; label = 'Convert Word to PDF (lock layout for sharing)' }
            @{ href = '/en/converters/document-converter/'; label = 'Browse all document conversions' }
        )
        faqs = @(
            @{ q = 'Can File Converter Pro extract tables from scanned PDF reports?'; a = 'Yes. Enable OCR in the output settings to extract table data from scanned or image-based PDFs. Scan quality at 300 DPI gives the best results.' }
            @{ q = 'How accurate is PDF to Excel table extraction?'; a = 'For text-based PDFs with clean table structure, accuracy is high. Complex or poorly formatted tables may need manual cleanup in Excel. Scanned PDFs depend on image quality.' }
            @{ q = 'Do I need Microsoft Excel installed for the conversion?'; a = 'No. File Converter Pro generates the XLSX file without Excel. You need Excel (or another spreadsheet app) to open and edit the output file.' }
            @{ q = 'Is the conversion offline?'; a = 'Yes. Everything runs locally on your Windows PC. Financial statements and business data are never uploaded to any server.' }
        )
        outputOptions = @(
            'XLSX output (Excel 2007+)'
            'OCR for scanned PDFs'
            'Multi-table to separate worksheets'
            'Column auto-detection'
            'Batch folder processing'
            'No Microsoft Excel required'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and extract PDF tables into editable Excel spreadsheets offline — OCR included, no upload, no watermark, free trial.'
    },

    @{
        slug = 'pdf-to-pptx'
        from = 'PDF'
        to = 'PPTX'
        catSlug = 'document-converter'
        catName = 'Document Converter'
        title = 'Convert PDF to PPTX on Windows — Offline | File Converter Pro'
        desc = 'Convert PDF to PowerPoint PPTX on Windows 10 and 11 offline. Each PDF page becomes an editable slide. No upload, no watermark, no subscription. Try free.'
        h1 = 'Convert PDF to PowerPoint on Windows — Offline &amp; Editable'
        heroSubtitle = 'Transform PDF pages into editable PowerPoint PPTX slides on Windows — offline, batch processing, no upload, free trial.'
        whyHtml = @'
                    <p>Presentations shared as PDFs are read-only — you cannot add animations, rearrange slides, change fonts, or insert your company template. Converting PDF back to PowerPoint (PPTX) gives you an <strong>editable slide deck that you can modify, brand, and present</strong> with full control in PowerPoint or LibreOffice Impress.</p>
                    <p>Common PDF to PowerPoint scenarios: receiving a vendor presentation as PDF and needing to edit it before showing to leadership; converting archived training material PDFs back to a format where slide notes can be added; extracting slides from a conference PDF to create a highlight reel; and incorporating slides from a partner''s PDF pitch deck into your own presentation.</p>
                    <p>Each PDF page becomes one editable slide in the PPTX. Text elements, headings, and layout objects are preserved as editable text boxes where the PDF structure allows it. Images are placed as editable slide objects. The level of editability depends on how the PDF was created — text-based PDFs allow more granular editing than scanned or image-only PDFs.</p>
                    <p>The conversion runs completely offline on your Windows 10 or 11 PC. Business presentations and confidential slide content never need to be uploaded to a cloud service.</p>
'@
        howSteps = @(
            @{ name = 'Install File Converter Pro'; text = 'Download from the Microsoft Store. Free trial includes PDF to PPTX conversion.' }
            @{ name = 'Add PDF files to the queue'; text = 'Drag PDF files or a folder into the app. Multi-page PDFs each become a multi-slide PPTX.' }
            @{ name = 'Select PPTX output'; text = 'Choose PowerPoint (PPTX) as output. For text-based PDFs, text extraction is enabled by default. For scanned or image PDFs, each page is placed as an image slide.' }
            @{ name = 'Convert offline'; text = 'Click Convert. PPTX files are generated locally. A 20-page PDF presentation converts to a 20-slide PPTX in seconds.' }
        )
        batchHtml = @'
                    <p>Training content migrations, conference archive digitisation, and presentation library consolidation all benefit from batch PDF to PPTX conversion.</p>
                    <ul>
                        <li>Convert an entire folder of PDF decks to PPTX in one run.</li>
                        <li>Each PDF becomes its own PPTX with the same filename.</li>
                        <li>Consistent slide size and layout settings apply across the batch.</li>
                        <li>Works offline — confidential business presentations stay local.</li>
                    </ul>
'@
        qualityHtml = @'
                    <ul>
                        <li><strong>Text-based PDFs:</strong> text is extracted and placed in editable text boxes on each slide. Fonts, sizes, and approximate positions are preserved.</li>
                        <li><strong>Image-only or scanned PDFs:</strong> each page is placed as a full-slide image. The slide is visually correct but text is not separately editable (use OCR mode to extract text from scanned slides).</li>
                        <li><strong>Slide dimensions:</strong> default is 16:9 widescreen. Switch to 4:3 standard if the source PDF used that aspect ratio.</li>
                        <li><strong>Image quality in slides:</strong> embedded images from the PDF are placed at the available resolution. Use 150-300 DPI extraction for crisp slide images.</li>
                    </ul>
'@
        issuesHtml = @'
                    <ul>
                        <li><strong>Text in wrong positions on slides.</strong> PDF uses absolute positioning; PowerPoint uses relative object layout. Text boxes are placed at their PDF positions — some manual realignment may be needed after conversion.</li>
                        <li><strong>Fonts look different.</strong> If the PDF font is not installed on your Windows machine, PowerPoint substitutes a similar font. Install the required fonts or use font-matching in PowerPoint.</li>
                        <li><strong>Scanned PDF slides not editable.</strong> For scanned PDFs, only the image is placed. Enable OCR in conversion settings to extract text layer from scanned slides.</li>
                        <li><strong>Slide size does not match the original.</strong> Check the original PDF page dimensions and match the PPTX slide size in PowerPoint under Design → Slide Size.</li>
                    </ul>
'@
        relatedLinks = @(
            @{ href = '/en/convert/pdf-to-word/'; label = 'Convert PDF to Word (text documents)' }
            @{ href = '/en/convert/pdf-to-jpg/'; label = 'Convert PDF to JPG (pages as images)' }
            @{ href = '/en/convert/word-to-pdf/'; label = 'Convert Word to PDF (lock for sharing)' }
            @{ href = '/en/converters/document-converter/'; label = 'Browse all document conversions' }
        )
        faqs = @(
            @{ q = 'Does each PDF page become one slide in PowerPoint?'; a = 'Yes. One PDF page = one PPTX slide. A 20-page PDF becomes a 20-slide PowerPoint presentation.' }
            @{ q = 'Can I edit the text in the resulting PowerPoint slides?'; a = 'For text-based PDFs yes — text is placed in editable text boxes. For scanned or image-only PDFs, the page is placed as an image slide (enable OCR to extract text from scanned content).' }
            @{ q = 'Do I need Microsoft PowerPoint installed for the conversion?'; a = 'No. File Converter Pro generates the PPTX without PowerPoint. You need PowerPoint or LibreOffice Impress to open and edit the output.' }
            @{ q = 'Is the conversion offline?'; a = 'Yes. PDF to PPTX conversion runs locally on your Windows PC. Your presentation content is never uploaded to any server.' }
        )
        outputOptions = @(
            'PPTX output (PowerPoint 2007+)'
            'Text extraction for text-based PDFs'
            'Image slides for scanned PDFs'
            'OCR for scanned slide text'
            '16:9 or 4:3 slide dimensions'
            'Batch folder processing'
        )
        closingPara = 'Download File Converter Pro from the Microsoft Store and convert your PDFs to editable PowerPoint presentations offline — one slide per page, no upload, no watermark, free trial.'
    }
)
