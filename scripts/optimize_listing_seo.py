import csv
from pathlib import Path


SOURCE = Path("notpush/listingData-9P94416WP5C8-1152921505700533604.csv")
TARGET = Path("notpush/listingData-9P94416WP5C8-1152921505700533604-seo.csv")

CORE_COLUMNS = {"Field", "ID", "Type (Type)", "default"}
FORCE_FEATURE_LOCALES = {"en-us", "en", "da", "sv", "no"}

BASE_FEATURES = [
    "100% offline conversion on your Windows PC",
    "44+ formats for documents, images, video and audio",
    "Convert PDF, DOCX, PPTX, TXT, RTF, HTML and Markdown",
    "Convert JPG, PNG, WebP, GIF, BMP, TIFF, SVG and ICO",
    "Convert MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV and FLAC",
    "Popular tasks: PDF to Word and Word to PDF",
    "Popular tasks: JPG to PNG, PNG to JPG, WebP to JPG",
    "Popular tasks: MP4 to MP3, WAV to MP3, MKV to MP4",
    "Batch conversion with drag-and-drop workflow",
    "No file size limits, no subscriptions, one-time purchase",
]

LOCALE_DATA = {
    "en-us": {
        "title": "File Converter Pro - PDF, Image, Video & Audio",
        "short": "Offline file converter for Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV and more. 44+ formats, no cloud uploads, no size limits.",
        "search": [
            "file converter",
            "pdf converter",
            "pdf to word",
            "image converter",
            "video converter",
            "audio converter",
            "offline converter",
        ],
        "append": "Popular conversions: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "en": {
        "title": "File Converter Pro - PDF, Image, Video & Audio",
        "short": "Offline file converter for Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV and more. 44+ formats, no cloud uploads, no size limits.",
        "search": [
            "file converter",
            "pdf converter",
            "pdf to word",
            "image converter",
            "video converter",
            "audio converter",
            "offline converter",
        ],
        "append": "Popular conversions: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "es": {
        "title": "File Converter Pro - PDF, Imagen, Video y Audio",
        "short": "Convierte archivos offline en Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV y más. 44+ formatos, sin nube, sin límites de tamaño.",
        "search": [
            "convertidor de archivos",
            "convertidor PDF",
            "PDF a Word",
            "convertidor de imagenes",
            "convertidor de video",
            "convertidor de audio",
            "convertidor offline",
        ],
        "append": "Conversiones populares: PDF a Word, Word a PDF, JPG a PNG, PNG a JPG, WebP a JPG, HEIC a JPG, SVG a PNG, MP4 a MP3, WAV a MP3, MKV a MP4, MOV a MP4, XLSX a CSV, CSV a JSON, JSON a XLSX.",
    },
    "fr": {
        "title": "File Converter Pro - PDF, Image, Video et Audio",
        "short": "Convertissez vos fichiers hors ligne sous Windows : PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV et plus. 44+ formats, sans cloud et sans limite.",
        "search": [
            "convertisseur de fichiers",
            "convertisseur PDF",
            "PDF en Word",
            "convertisseur d images",
            "convertisseur video",
            "convertisseur audio",
            "convertisseur hors ligne",
        ],
        "append": "Conversions populaires : PDF vers Word, Word vers PDF, JPG vers PNG, PNG vers JPG, WebP vers JPG, HEIC vers JPG, SVG vers PNG, MP4 vers MP3, WAV vers MP3, MKV vers MP4, MOV vers MP4, XLSX vers CSV, CSV vers JSON, JSON vers XLSX.",
    },
    "it": {
        "title": "File Converter Pro - PDF, Immagini, Video e Audio",
        "short": "Converti file offline su Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV e altro. 44+ formati, senza cloud e senza limiti di dimensione.",
        "search": [
            "convertitore file",
            "convertitore PDF",
            "PDF in Word",
            "convertitore immagini",
            "convertitore video",
            "convertitore audio",
            "convertitore offline",
        ],
        "append": "Conversioni popolari: PDF in Word, Word in PDF, JPG in PNG, PNG in JPG, WebP in JPG, HEIC in JPG, SVG in PNG, MP4 in MP3, WAV in MP3, MKV in MP4, MOV in MP4, XLSX in CSV, CSV in JSON, JSON in XLSX.",
    },
    "de": {
        "title": "File Converter Pro - PDF, Bild, Video und Audio",
        "short": "Dateien offline unter Windows konvertieren: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV und mehr. 44+ Formate, ohne Cloud und ohne Größenlimit.",
        "search": [
            "dateikonverter",
            "pdf konverter",
            "PDF zu Word",
            "bildkonverter",
            "videokonverter",
            "audiokonverter",
            "offline konverter",
        ],
        "append": "Beliebte Konvertierungen: PDF zu Word, Word zu PDF, JPG zu PNG, PNG zu JPG, WebP zu JPG, HEIC zu JPG, SVG zu PNG, MP4 zu MP3, WAV zu MP3, MKV zu MP4, MOV zu MP4, XLSX zu CSV, CSV zu JSON, JSON zu XLSX.",
    },
    "pt-br": {
        "title": "File Converter Pro - PDF, Imagem, Video e Audio",
        "short": "Converta arquivos offline no Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV e mais. 44+ formatos, sem nuvem e sem limite de tamanho.",
        "search": [
            "conversor de arquivos",
            "conversor PDF",
            "PDF para Word",
            "conversor de imagens",
            "conversor de video",
            "conversor de audio",
            "conversor offline",
        ],
        "append": "Conversoes populares: PDF para Word, Word para PDF, JPG para PNG, PNG para JPG, WebP para JPG, HEIC para JPG, SVG para PNG, MP4 para MP3, WAV para MP3, MKV para MP4, MOV para MP4, XLSX para CSV, CSV para JSON, JSON para XLSX.",
    },
    "id": {
        "title": "File Converter Pro - PDF, Gambar, Video dan Audio",
        "short": "Konversi file offline di Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV, dan lainnya. 44+ format, tanpa cloud, tanpa batas ukuran file.",
        "search": [
            "konverter file",
            "konverter PDF",
            "PDF ke Word",
            "konverter gambar",
            "konverter video",
            "konverter audio",
            "konverter offline",
        ],
        "append": "Konversi populer: PDF ke Word, Word ke PDF, JPG ke PNG, PNG ke JPG, WebP ke JPG, HEIC ke JPG, SVG ke PNG, MP4 ke MP3, WAV ke MP3, MKV ke MP4, MOV ke MP4, XLSX ke CSV, CSV ke JSON, JSON ke XLSX.",
    },
    "ja": {
        "title": "File Converter Pro - PDF・画像・動画・音声変換",
        "short": "Windowsでファイルをオフライン変換。PDF、Word、JPG、PNG、WebP、MP4、MP3、CSVなど44+形式対応。クラウド不要、サイズ制限なし。",
        "search": [
            "ファイル変換",
            "PDF変換",
            "PDFをWordに変換",
            "画像変換",
            "動画変換",
            "音声変換",
            "オフライン変換",
        ],
        "features": [
            "Windows PCで100%オフライン変換",
            "文書・画像・動画・音声を44+形式で変換",
            "PDF、DOCX、PPTX、TXT、RTF、HTML、Markdown対応",
            "JPG、PNG、WebP、GIF、BMP、TIFF、SVG、ICO対応",
            "MP4、MKV、MOV、AVI、WebM、WMV、MP3、WAV、FLAC対応",
            "人気の変換: PDF→Word、Word→PDF",
            "人気の変換: JPG→PNG、PNG→JPG、WebP→JPG",
            "人気の変換: MP4→MP3、WAV→MP3、MKV→MP4",
            "ドラッグ&ドロップ対応の一括変換",
            "サイズ無制限、サブスク不要、買い切り",
        ],
        "append": "よく使われる変換: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "ms": {
        "title": "File Converter Pro - PDF, Imej, Video dan Audio",
        "short": "Tukar fail secara offline di Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV dan lagi. 44+ format, tanpa cloud, tanpa had saiz fail.",
        "search": [
            "penukar fail",
            "penukar PDF",
            "PDF ke Word",
            "penukar imej",
            "penukar video",
            "penukar audio",
            "penukar luar talian",
        ],
        "append": "Penukaran popular: PDF ke Word, Word ke PDF, JPG ke PNG, PNG ke JPG, WebP ke JPG, HEIC ke JPG, SVG ke PNG, MP4 ke MP3, WAV ke MP3, MKV ke MP4, MOV ke MP4, XLSX ke CSV, CSV ke JSON, JSON ke XLSX.",
    },
    "uk": {
        "title": "File Converter Pro - PDF, Зображення, Відео й Аудіо",
        "short": "Офлайн конвертер файлів для Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV та інші. 44+ форматів, без хмари та обмежень розміру.",
        "search": [
            "конвертер файлів",
            "конвертер PDF",
            "PDF у Word",
            "конвертер зображень",
            "конвертер відео",
            "конвертер аудіо",
            "офлайн конвертер",
        ],
        "features": [
            "100% офлайн конвертація на вашому ПК з Windows",
            "44+ форматів для документів, зображень, відео та аудіо",
            "Конвертуйте PDF, DOCX, PPTX, TXT, RTF, HTML і Markdown",
            "Конвертуйте JPG, PNG, WebP, GIF, BMP, TIFF, SVG та ICO",
            "Конвертуйте MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV і FLAC",
            "Популярно: PDF у Word і Word у PDF",
            "Популярно: JPG у PNG, PNG у JPG, WebP у JPG",
            "Популярно: MP4 у MP3, WAV у MP3, MKV у MP4",
            "Пакетна конвертація з drag-and-drop",
            "Без лімітів розміру, без підписок, одноразова покупка",
        ],
        "append": "Популярні конвертації: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "zh": {
        "title": "File Converter Pro - PDF、图像、视频与音频转换",
        "short": "Windows 离线文件转换器：支持 PDF、Word、JPG、PNG、WebP、MP4、MP3、CSV 等 44+ 格式。无需云上传，无大小限制。",
        "search": [
            "文件转换器",
            "PDF转换器",
            "PDF转Word",
            "图片转换器",
            "视频转换器",
            "音频转换器",
            "离线转换器",
        ],
        "features": [
            "在 Windows 电脑上 100% 离线转换",
            "支持文档、图像、视频、音频 44+ 格式",
            "支持转换 PDF、DOCX、PPTX、TXT、RTF、HTML、Markdown",
            "支持转换 JPG、PNG、WebP、GIF、BMP、TIFF、SVG、ICO",
            "支持转换 MP4、MKV、MOV、AVI、WebM、WMV、MP3、WAV、FLAC",
            "热门任务：PDF 转 Word、Word 转 PDF",
            "热门任务：JPG 转 PNG、PNG 转 JPG、WebP 转 JPG",
            "热门任务：MP4 转 MP3、WAV 转 MP3、MKV 转 MP4",
            "批量转换 + 拖放工作流",
            "无文件大小限制、无订阅、一次购买",
        ],
        "append": "热门转换：PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "ko": {
        "title": "File Converter Pro - PDF, 이미지, 동영상 및 오디오 변환",
        "short": "Windows용 오프라인 파일 변환기: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV 등 44+ 형식 지원. 클라우드 업로드 없이 크기 제한 없음.",
        "search": [
            "파일 변환기",
            "PDF 변환",
            "PDF를 Word로 변환",
            "이미지 변환",
            "동영상 변환",
            "오디오 변환",
            "오프라인 변환",
        ],
        "features": [
            "Windows PC에서 100% 오프라인 변환",
            "문서, 이미지, 동영상, 오디오 44+ 형식 지원",
            "PDF, DOCX, PPTX, TXT, RTF, HTML, Markdown 변환",
            "JPG, PNG, WebP, GIF, BMP, TIFF, SVG, ICO 변환",
            "MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV, FLAC 변환",
            "인기 작업: PDF→Word, Word→PDF",
            "인기 작업: JPG→PNG, PNG→JPG, WebP→JPG",
            "인기 작업: MP4→MP3, WAV→MP3, MKV→MP4",
            "드래그 앤 드롭 기반 일괄 변환",
            "용량 제한 없음, 구독 없음, 1회 구매",
        ],
        "append": "인기 변환: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "vi": {
        "title": "File Converter Pro - PDF, Hinh anh, Video va Am thanh",
        "short": "Trinh chuyen doi tep offline cho Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV va hon nua. Ho tro 44+ dinh dang, khong cloud, khong gioi han dung luong.",
        "search": [
            "chuyen doi tep",
            "chuyen PDF",
            "PDF sang Word",
            "doi hinh anh",
            "doi video",
            "doi am thanh",
            "doi offline",
        ],
        "features": [
            "Chuyen doi 100% offline tren PC Windows",
            "44+ dinh dang cho tai lieu, hinh anh, video va am thanh",
            "Chuyen doi PDF, DOCX, PPTX, TXT, RTF, HTML va Markdown",
            "Chuyen doi JPG, PNG, WebP, GIF, BMP, TIFF, SVG va ICO",
            "Chuyen doi MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV va FLAC",
            "Tac vu pho bien: PDF sang Word va Word sang PDF",
            "Tac vu pho bien: JPG sang PNG, PNG sang JPG, WebP sang JPG",
            "Tac vu pho bien: MP4 sang MP3, WAV sang MP3, MKV sang MP4",
            "Chuyen doi hang loat voi keo-tha",
            "Khong gioi han dung luong, khong thue bao, mua mot lan",
        ],
        "append": "Chuyen doi pho bien: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "da": {
        "title": "File Converter Pro - PDF, Billede, Video og Lyd",
        "short": "Offline filkonverter til Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV og mere. 44+ formater, ingen cloud-upload og ingen storrelsesgraenser.",
        "search": [
            "filkonverter",
            "PDF konverter",
            "PDF til Word",
            "billedkonverter",
            "videokonverter",
            "lydkonverter",
            "offline konverter",
        ],
        "features": [
            "100% offline konvertering pa din Windows-pc",
            "44+ formater til dokumenter, billeder, video og lyd",
            "Konverter PDF, DOCX, PPTX, TXT, RTF, HTML og Markdown",
            "Konverter JPG, PNG, WebP, GIF, BMP, TIFF, SVG og ICO",
            "Konverter MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV og FLAC",
            "Populaere opgaver: PDF til Word og Word til PDF",
            "Populaere opgaver: JPG til PNG, PNG til JPG, WebP til JPG",
            "Populaere opgaver: MP4 til MP3, WAV til MP3, MKV til MP4",
            "Batchkonvertering med traek-og-slip",
            "Ingen storrelsesgraenser, ingen abonnementer, engangskob",
        ],
        "append": "Populaere konverteringer: PDF til Word, Word til PDF, JPG til PNG, PNG til JPG, WebP til JPG, HEIC til JPG, SVG til PNG, MP4 til MP3, WAV til MP3, MKV til MP4, MOV til MP4, XLSX til CSV, CSV til JSON, JSON til XLSX.",
    },
    "th": {
        "title": "File Converter Pro - PDF, รูปภาพ, วิดีโอ และเสียง",
        "short": "โปรแกรมแปลงไฟล์ออฟไลน์สำหรับ Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV และอื่นๆ รองรับ 44+ รูปแบบ ไม่ต้องอัปโหลดคลาวด์",
        "search": [
            "ตัวแปลงไฟล์",
            "แปลง PDF",
            "PDF เป็น Word",
            "แปลงรูปภาพ",
            "แปลงวิดีโอ",
            "แปลงเสียง",
            "ตัวแปลงออฟไลน์",
        ],
        "features": [
            "แปลงไฟล์แบบออฟไลน์ 100% บน Windows",
            "รองรับ 44+ รูปแบบสำหรับเอกสาร รูปภาพ วิดีโอ และเสียง",
            "แปลง PDF, DOCX, PPTX, TXT, RTF, HTML และ Markdown",
            "แปลง JPG, PNG, WebP, GIF, BMP, TIFF, SVG และ ICO",
            "แปลง MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV และ FLAC",
            "งานยอดนิยม: PDF เป็น Word และ Word เป็น PDF",
            "งานยอดนิยม: JPG เป็น PNG, PNG เป็น JPG, WebP เป็น JPG",
            "งานยอดนิยม: MP4 เป็น MP3, WAV เป็น MP3, MKV เป็น MP4",
            "แปลงไฟล์เป็นชุดด้วยการลากและวาง",
            "ไม่จำกัดขนาดไฟล์ ไม่มีค่าสมาชิก จ่ายครั้งเดียว",
        ],
        "append": "การแปลงยอดนิยม: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "sv": {
        "title": "File Converter Pro - PDF, Bild, Video och Ljud",
        "short": "Offline filkonverterare for Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV med mera. 44+ format, ingen molnuppladdning och inga storleksgranser.",
        "search": [
            "filkonverterare",
            "PDF-konverterare",
            "PDF till Word",
            "bildkonverterare",
            "videokonverterare",
            "ljudkonverterare",
            "offline-konverterare",
        ],
        "features": [
            "100% offline-konvertering pa din Windows-dator",
            "44+ format for dokument, bilder, video och ljud",
            "Konvertera PDF, DOCX, PPTX, TXT, RTF, HTML och Markdown",
            "Konvertera JPG, PNG, WebP, GIF, BMP, TIFF, SVG och ICO",
            "Konvertera MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV och FLAC",
            "Vanliga uppgifter: PDF till Word och Word till PDF",
            "Vanliga uppgifter: JPG till PNG, PNG till JPG, WebP till JPG",
            "Vanliga uppgifter: MP4 till MP3, WAV till MP3, MKV till MP4",
            "Batchkonvertering med dra-och-slapp",
            "Inga storleksgranser, inga abonnemang, engangskop",
        ],
        "append": "Populära konverteringar: PDF till Word, Word till PDF, JPG till PNG, PNG till JPG, WebP till JPG, HEIC till JPG, SVG till PNG, MP4 till MP3, WAV till MP3, MKV till MP4, MOV till MP4, XLSX till CSV, CSV till JSON, JSON till XLSX.",
    },
    "hu": {
        "title": "File Converter Pro - PDF, Kep, Video es Hang",
        "short": "Offline fajlkonvertalo Windowshoz: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV es tovabbi formatumok. 44+ formatum, felho nelkul, meretkorlat nelkul.",
        "search": [
            "fajlkonvertalo",
            "PDF konvertalo",
            "PDF Word-be",
            "kepkonvertalo",
            "videokonvertalo",
            "hangkonvertalo",
            "offline konvertalo",
        ],
        "features": [
            "100% offline konvertalas Windows PC-n",
            "44+ formatum dokumentumokhoz, kepekhez, videhoz es hanghoz",
            "Konvertalj PDF, DOCX, PPTX, TXT, RTF, HTML es Markdown",
            "Konvertalj JPG, PNG, WebP, GIF, BMP, TIFF, SVG es ICO",
            "Konvertalj MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV es FLAC",
            "Nepszeru feladatok: PDF Word-be es Word PDF-be",
            "Nepszeru feladatok: JPG PNG-be, PNG JPG-be, WebP JPG-be",
            "Nepszeru feladatok: MP4 MP3-ba, WAV MP3-ba, MKV MP4-be",
            "Tomeges konvertalas drag-and-drop munkafolyamattal",
            "Nincs meretkorlat, nincs elofizetes, egyszeri vasarlas",
        ],
        "append": "Nepszeru konvertalasok: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "el": {
        "title": "File Converter Pro - PDF, Εικόνα, Βίντεο και Ήχος",
        "short": "Offline μετατροπέας αρχείων για Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV και άλλα. 44+ μορφές, χωρίς cloud και χωρίς όριο μεγέθους.",
        "search": [
            "μετατροπέας αρχείων",
            "μετατροπέας PDF",
            "PDF σε Word",
            "μετατροπέας εικόνας",
            "μετατροπέας βίντεο",
            "μετατροπέας ήχου",
            "offline μετατροπέας",
        ],
        "features": [
            "100% offline μετατροπή στο Windows PC σας",
            "44+ μορφές για έγγραφα, εικόνες, βίντεο και ήχο",
            "Μετατρέψτε PDF, DOCX, PPTX, TXT, RTF, HTML και Markdown",
            "Μετατρέψτε JPG, PNG, WebP, GIF, BMP, TIFF, SVG και ICO",
            "Μετατρέψτε MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV και FLAC",
            "Δημοφιλή: PDF σε Word και Word σε PDF",
            "Δημοφιλή: JPG σε PNG, PNG σε JPG, WebP σε JPG",
            "Δημοφιλή: MP4 σε MP3, WAV σε MP3, MKV σε MP4",
            "Μαζική μετατροπή με drag-and-drop",
            "Χωρίς όριο μεγέθους, χωρίς συνδρομή, εφάπαξ αγορά",
        ],
        "append": "Δημοφιλείς μετατροπές: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "no": {
        "title": "File Converter Pro - PDF, Bilde, Video og Lyd",
        "short": "Offline filkonverterer for Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV og mer. 44+ formater, ingen skyopplasting og ingen storrelsesgrenser.",
        "search": [
            "filkonverterer",
            "PDF-konverterer",
            "PDF til Word",
            "bildekonverterer",
            "videokonverterer",
            "lydkonverterer",
            "offline konverterer",
        ],
        "features": [
            "100% offline konvertering pa din Windows-PC",
            "44+ formater for dokumenter, bilder, video og lyd",
            "Konverter PDF, DOCX, PPTX, TXT, RTF, HTML og Markdown",
            "Konverter JPG, PNG, WebP, GIF, BMP, TIFF, SVG og ICO",
            "Konverter MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV og FLAC",
            "Populaere oppgaver: PDF til Word og Word til PDF",
            "Populaere oppgaver: JPG til PNG, PNG til JPG, WebP til JPG",
            "Populaere oppgaver: MP4 til MP3, WAV til MP3, MKV til MP4",
            "Batchkonvertering med dra-og-slipp",
            "Ingen storrelsesgrenser, ingen abonnement, engangskjop",
        ],
        "append": "Populare konverteringer: PDF til Word, Word til PDF, JPG til PNG, PNG til JPG, WebP til JPG, HEIC til JPG, SVG til PNG, MP4 til MP3, WAV til MP3, MKV til MP4, MOV til MP4, XLSX til CSV, CSV til JSON, JSON til XLSX.",
    },
    "ro": {
        "title": "File Converter Pro - PDF, Imagine, Video si Audio",
        "short": "Convertor de fisiere offline pentru Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV si altele. 44+ formate, fara cloud si fara limita de dimensiune.",
        "search": [
            "convertor fisiere",
            "convertor PDF",
            "PDF in Word",
            "convertor imagini",
            "convertor video",
            "convertor audio",
            "convertor offline",
        ],
        "features": [
            "Conversie 100% offline pe PC-ul tau Windows",
            "44+ formate pentru documente, imagini, video si audio",
            "Converteste PDF, DOCX, PPTX, TXT, RTF, HTML si Markdown",
            "Converteste JPG, PNG, WebP, GIF, BMP, TIFF, SVG si ICO",
            "Converteste MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV si FLAC",
            "Sarcini populare: PDF in Word si Word in PDF",
            "Sarcini populare: JPG in PNG, PNG in JPG, WebP in JPG",
            "Sarcini populare: MP4 in MP3, WAV in MP3, MKV in MP4",
            "Conversie batch cu flux drag-and-drop",
            "Fara limita de dimensiune, fara abonamente, plata unica",
        ],
        "append": "Conversii populare: PDF in Word, Word in PDF, JPG in PNG, PNG in JPG, WebP in JPG, HEIC in JPG, SVG in PNG, MP4 in MP3, WAV in MP3, MKV in MP4, MOV in MP4, XLSX in CSV, CSV in JSON, JSON in XLSX.",
    },
    "sk": {
        "title": "File Converter Pro - PDF, Obrazky, Video a Audio",
        "short": "Offline konvertor suborov pre Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV a dalsie. 44+ formatov, bez cloudu a bez limitu velkosti.",
        "search": [
            "konvertor suborov",
            "konvertor PDF",
            "PDF do Word",
            "konvertor obrazkov",
            "konvertor videa",
            "konvertor audia",
            "offline konvertor",
        ],
        "features": [
            "100% offline konverzia na vasom Windows PC",
            "44+ formatov pre dokumenty, obrazky, video a audio",
            "Konvertujte PDF, DOCX, PPTX, TXT, RTF, HTML a Markdown",
            "Konvertujte JPG, PNG, WebP, GIF, BMP, TIFF, SVG a ICO",
            "Konvertujte MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV a FLAC",
            "Oblubene ulohy: PDF do Word a Word do PDF",
            "Oblubene ulohy: JPG do PNG, PNG do JPG, WebP do JPG",
            "Oblubene ulohy: MP4 do MP3, WAV do MP3, MKV do MP4",
            "Davkova konverzia s drag-and-drop workflow",
            "Bez limitu velkosti, bez predplatneho, jednorazova kupa",
        ],
        "append": "Popularne konverzie: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "fil": {
        "title": "File Converter Pro - PDF, Larawan, Video at Audio",
        "short": "Offline file converter para sa Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV at iba pa. 44+ format, walang cloud upload at walang size limit.",
        "search": [
            "file converter",
            "PDF converter",
            "PDF to Word",
            "image converter",
            "video converter",
            "audio converter",
            "offline converter",
        ],
        "append": "Mga sikat na conversion: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "fi": {
        "title": "File Converter Pro - PDF, Kuva, Video ja Aani",
        "short": "Offline tiedostomuunnin Windowsille: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV ja paljon muuta. 44+ formaattia, ei pilvea eika kokorajoja.",
        "search": [
            "tiedostomuunnin",
            "PDF-muunnin",
            "PDF Wordiksi",
            "kuvamuunnin",
            "videomuunnin",
            "aanimuunnin",
            "offline-muunnin",
        ],
        "features": [
            "100% offline-muunnos Windows-tietokoneella",
            "44+ formaattia asiakirjoille, kuville, videolle ja aanelle",
            "Muunna PDF, DOCX, PPTX, TXT, RTF, HTML ja Markdown",
            "Muunna JPG, PNG, WebP, GIF, BMP, TIFF, SVG ja ICO",
            "Muunna MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV ja FLAC",
            "Suosittua: PDF Wordiksi ja Word PDF:ksi",
            "Suosittua: JPG PNG:ksi, PNG JPG:ksi, WebP JPG:ksi",
            "Suosittua: MP4 MP3:ksi, WAV MP3:ksi, MKV MP4:ksi",
            "Eramuunnos drag-and-drop-tyonkululla",
            "Ei kokorajoja, ei tilauksia, kertamaksu",
        ],
        "append": "Suositut muunnokset: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
    "cs": {
        "title": "File Converter Pro - PDF, Obrazky, Video a Audio",
        "short": "Offline konvertor souboru pro Windows: PDF, Word, JPG, PNG, WebP, MP4, MP3, CSV a dalsi. 44+ formatu, bez cloudu a bez limitu velikosti.",
        "search": [
            "konvertor souboru",
            "konvertor PDF",
            "PDF do Word",
            "konvertor obrazku",
            "konvertor videa",
            "konvertor zvuku",
            "offline konvertor",
        ],
        "features": [
            "100% offline konverze na vasem Windows PC",
            "44+ formatu pro dokumenty, obrazky, video a audio",
            "Prevadejte PDF, DOCX, PPTX, TXT, RTF, HTML a Markdown",
            "Prevadejte JPG, PNG, WebP, GIF, BMP, TIFF, SVG a ICO",
            "Prevadejte MP4, MKV, MOV, AVI, WebM, WMV, MP3, WAV a FLAC",
            "Oblibene ulohy: PDF do Word a Word do PDF",
            "Oblibene ulohy: JPG do PNG, PNG do JPG, WebP do JPG",
            "Oblibene ulohy: MP4 do MP3, WAV do MP3, MKV do MP4",
            "Davkova konverze s drag-and-drop workflow",
            "Bez limitu velikosti, bez predplatneho, jednorazovy nakup",
        ],
        "append": "Popularni konverze: PDF to Word, Word to PDF, JPG to PNG, PNG to JPG, WebP to JPG, HEIC to JPG, SVG to PNG, MP4 to MP3, WAV to MP3, MKV to MP4, MOV to MP4, XLSX to CSV, CSV to JSON, JSON to XLSX.",
    },
}


def normalize_description(text: str, append_text: str) -> str:
    value = (text or "").replace("FileForge", "File Converter Pro")
    value = value.replace("32+", "44+").replace("32 +", "44+")
    if append_text and append_text not in value:
        value = value.rstrip() + "\n\n" + append_text
    return value.strip()


def apply_changes() -> None:
    with SOURCE.open("r", encoding="utf-8-sig", newline="") as f:
        rows = list(csv.DictReader(f))
        fieldnames = list(rows[0].keys())

    by_field = {row["Field"]: row for row in rows}
    locales = [col for col in fieldnames if col not in CORE_COLUMNS]

    for locale in locales:
        data = LOCALE_DATA.get(locale, LOCALE_DATA["en-us"])
        by_field["Title"][locale] = data["title"]
        by_field["ShortDescription"][locale] = data["short"]
        by_field["Description"][locale] = normalize_description(by_field["Description"].get(locale, ""), data["append"])

        for i, keyword in enumerate(data["search"], start=1):
            by_field[f"SearchTerm{i}"][locale] = keyword
        selected_features = data.get("features", BASE_FEATURES)
        for i, feature in enumerate(selected_features, start=1):
            field = by_field[f"Feature{i}"]
            current = (field.get(locale) or "").strip()
            if "features" in data:
                field[locale] = feature
            elif locale in FORCE_FEATURE_LOCALES or not current:
                field[locale] = feature
            else:
                field[locale] = current.replace("FileForge", "File Converter Pro").replace("32+", "44+")

    with TARGET.open("w", encoding="utf-8-sig", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def validate() -> list[str]:
    with TARGET.open("r", encoding="utf-8-sig", newline="") as f:
        rows = list(csv.DictReader(f))
        fieldnames = list(rows[0].keys())

    by_field = {row["Field"]: row for row in rows}
    locales = [col for col in fieldnames if col not in CORE_COLUMNS]
    issues: list[str] = []

    for locale in locales:
        terms = []
        for i in range(1, 8):
            term = by_field[f"SearchTerm{i}"].get(locale, "").strip()
            if len(term) > 40:
                issues.append(f"{locale}: SearchTerm{i} > 40 chars ({len(term)})")
            if term:
                terms.append(term)
        total_words = sum(len(term.split()) for term in terms)
        if total_words > 21:
            issues.append(f"{locale}: search terms exceed 21 words ({total_words})")

        short_len = len(by_field["ShortDescription"].get(locale, "").strip())
        if short_len > 270:
            issues.append(f"{locale}: ShortDescription > 270 chars ({short_len})")

        desc_len = len(by_field["Description"].get(locale, "").strip())
        if desc_len > 10000:
            issues.append(f"{locale}: Description > 10000 chars ({desc_len})")

        for i in range(1, 11):
            feat_len = len(by_field[f"Feature{i}"].get(locale, "").strip())
            if feat_len > 200:
                issues.append(f"{locale}: Feature{i} > 200 chars ({feat_len})")

    return issues


if __name__ == "__main__":
    apply_changes()
    issues = validate()
    if issues:
        print("VALIDATION_ISSUES")
        for issue in issues:
            print(issue)
    else:
        print("OK")
    print(f"Wrote: {TARGET}")
