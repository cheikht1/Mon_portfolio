import qrcode
from PIL import Image, ImageDraw, ImageFont
import os

# URL de ton site GitHub Pages
url = "https://www.cheikhthiam.live/"

# Générer le code QR
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_H,
    box_size=10,
    border=4,
)
qr.add_data(url)
qr.make(fit=True)

# Créer une image du QR Code
qr_img = qr.make_image(fill_color="black", back_color="white")

# Créer une image plus grande pour y ajouter du texte
img_size = 500
img = Image.new('RGB', (img_size, img_size + 50), color='white')

# Ajouter le QR code à l'image
qr_pos = ((img_size - qr_img.size[0]) // 2, (img_size - qr_img.size[1]) // 2)
img.paste(qr_img, qr_pos)

# Ajouter du texte sous le QR code
draw = ImageDraw.Draw(img)
font_path = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"  # Ajustez le chemin selon votre système
if os.path.exists(font_path):
    font = ImageFont.truetype(font_path, 20)
else:
    font = ImageFont.load_default()
text = "Scannez pour visiter mon site"
text_width = draw.textlength(text, font=font)
text_position = ((img_size - text_width) // 2, img_size + 10)
draw.text(text_position, text, font=font, fill="black")

# Sauvegarder l'image
img.save("github_pages_qr_code.png")
print("QR code généré et sauvegardé comme 'github_pages_qr_code.png'")