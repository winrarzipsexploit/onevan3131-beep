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

### ▼ Ne paylaşıyoruz?

Telegram'da her CVE için **ham madde — sadece araç dosyaları**:

| ✅ Paylaşılır | ❌ Paylaşılmaz |
|--------------|----------------|
| `*_core.py` — exploit motoru | Hedef domain listesi (`targets.txt`, FOFA export) |
| `CVE-*-Suite.py` — batch CLI | Tarama sonuçları (`panels_*.txt`, `uploads_ok.txt`) |
| `payloads/x7-panel.php` — panel | Canlı panel / shell URL'leri |
| `requirements.txt` | JSON log, hit listesi, retry listesi |

> Kullanım bilgisi (etkilenen sürüm, fix, tek/toplu komut örneği) metin olarak verilir — **sonuç ve liste asla eklenmez.**

📡 **Suite indir:** [Telegram — winrarzipsexploit](https://t.me/winrarzipsteam)

---

### 📦 Paylaşım paketi yapısı (örnek)

```
CVE-2026-48908/
├── sppb48908_core.py          # exploit core
├── CVE-2026-48908-Suite.py    # batch + tek hedef CLI
├── CVE-2026-48908.py          # kısa tek hedef wrapper
├── requirements.txt
└── payloads/
    └── x7-panel.php           # RCE panel payload
```

Zip olarak Telegram'da — **içinde `runs/`, liste veya sonuç dosyası yok.**

---

### 🔴 CVE-2026-48908 — SP Page Builder

**Joomla `com_sppagebuilder` — Unauth ZIP Upload → RCE**

| | |
|---|---|
| **Etkilenen** | SP Page Builder **≤ 6.6.1** |
| **Fixed** | **6.6.2+** |
| **Vektör** | `task=asset.uploadCustomIcon` |
| **Payload** | `payloads/x7-panel.php` |

#### 🛡️ Fix

1. Plugin **6.6.2+** güncelle
2. `/media/com_sppagebuilder/` → PHP exec kapat
3. `.htaccess` / AllowOverride kısıtla
4. Upload POST için WAF kuralı

#### 🎯 Tek hedef

```bash
pip install -r requirements.txt
python CVE-2026-48908-Suite.py -u https://LAB-URL --yes
```

#### 📦 Toplu (kendi listende)

```bash
python CVE-2026-48908-Suite.py -f targets.txt --yes --threads 15
```

`targets.txt` → **sen oluşturursun**, biz paylaşmayız.

#### Çıktı etiketleri (örnek)

```
patched_662_plus | upload_rejected | waf_cloudflare | sppb_html_no_json
```

---

### 💻 Tech Stack

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![Joomla](https://img.shields.io/badge/Joomla-5091CD?style=for-the-badge&logo=joomla&logoColor=white)
![WordPress](https://img.shields.io/badge/WordPress-21759B?style=for-the-badge&logo=wordpress&logoColor=white)
![Burp Suite](https://img.shields.io/badge/Burp_Suite-FF6633?style=for-the-badge&logo=burp-suite&logoColor=white)

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
