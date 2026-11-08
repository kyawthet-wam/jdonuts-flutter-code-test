"""Generates placeholder SVG artwork for the bundled seed data.

The client's photos are not available, so every product, banner, shop and the
member avatar is drawn here. Run: tool/build_seed_assets.sh (macOS: draws SVGs, then converts to PNG)
"""
import math
import pathlib

OUT = pathlib.Path(__file__).resolve().parent / "seed_art"
OUT.mkdir(parents=True, exist_ok=True)

DOUGH = "#F6C28B"
CREAM = "#FFF4E6"


def svg(body, size=200):
    return (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {size} {size}">'
            f"{body}</svg>")


def donut(cx, cy, r, icing, drizzle=None, sprinkles=True):
    parts = [
        f'<circle cx="{cx}" cy="{cy}" r="{r}" fill="{DOUGH}"/>',
        f'<circle cx="{cx}" cy="{cy}" r="{r * 0.86}" fill="{icing}"/>',
    ]
    if drizzle:
        for i in range(5):
            y = cy - r * 0.6 + i * r * 0.3
            parts.append(
                f'<path d="M{cx - r * 0.7} {y} q{r * 0.35} {r * 0.2} {r * 0.7} 0 '
                f't{r * 0.7} 0" stroke="{drizzle}" stroke-width="{r * 0.07}" '
                f'fill="none" stroke-linecap="round"/>')
    if sprinkles:
        for i in range(12):
            a = i * 2.39996
            d = r * (0.4 + 0.4 * ((i * 7) % 5) / 5)
            x, y = cx + math.cos(a) * d, cy + math.sin(a) * d
            dx, dy = math.cos(a + 1) * r * 0.06, math.sin(a + 1) * r * 0.06
            parts.append(f'<line x1="{x - dx}" y1="{y - dy}" x2="{x + dx}" '
                         f'y2="{y + dy}" stroke="#fff" stroke-width="{r * 0.045}" '
                         f'stroke-linecap="round"/>')
    parts.append(f'<circle cx="{cx}" cy="{cy}" r="{r * 0.22}" fill="#fff"/>')
    return "".join(parts)


def box(colors):
    parts = ['<rect x="14" y="40" width="172" height="130" rx="18" fill="#fff"/>']
    for i, c in enumerate(colors[:6]):
        x, y = 50 + (i % 3) * 50, 78 + (i // 3) * 54
        parts.append(donut(x, y, 22, c, sprinkles=i % 2 == 0))
    return svg("".join(parts))


def coffee(cream="#F4E3CF", coffee_c="#6B4226"):
    return svg(
        f'<path d="M62 36h76l-8 132a10 10 0 0 1-10 9H80a10 10 0 0 1-10-9z" '
        f'fill="#fff" stroke="#E5E7EB" stroke-width="3"/>'
        f'<path d="M66 70h68l-5 98a8 8 0 0 1-8 7H79a8 8 0 0 1-8-7z" fill="{coffee_c}"/>'
        f'<path d="M66 70h68l-1.6 30c-20 10-44 10-65 0z" fill="{cream}"/>'
        f'<rect x="58" y="28" width="84" height="12" rx="6" fill="#E5E7EB"/>')


def cookies():
    parts = []
    for i, (x, y) in enumerate([(60, 70), (130, 66), (96, 130)]):
        parts.append(f'<circle cx="{x}" cy="{y}" r="38" fill="#D9A066"/>')
        for j in range(6):
            a = j * 1.05 + i
            parts.append(f'<circle cx="{x + math.cos(a) * 20}" cy="{y + math.sin(a) * 20}" '
                         f'r="5" fill="#5A3A22"/>')
    return svg("".join(parts))


def banner(c1, c2, icing):
    return (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 160">'
            f'<defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1">'
            f'<stop offset="0" stop-color="{c1}"/><stop offset="1" stop-color="{c2}"/>'
            f'</linearGradient></defs><rect width="320" height="160" fill="url(#g)"/>'
            f'{donut(262, 112, 56, icing)}</svg>')


def shop(roof):
    return (f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 150">'
            f'<rect width="240" height="150" fill="#FFF1E3"/>'
            f'<rect x="30" y="60" width="180" height="80" fill="#fff"/>'
            f'<rect x="46" y="84" width="148" height="56" rx="6" fill="#FFE2C2"/>'
            f'<path d="M20 60l14-36h172l14 36z" fill="{roof}"/>'
            f'{donut(90, 112, 18, "#F7A8CB")}{donut(150, 112, 18, "#5BCFEB")}</svg>')


def avatar():
    return svg('<rect width="200" height="200" fill="#FDE8D7"/>'
               '<circle cx="100" cy="82" r="38" fill="#E9B48B"/>'
               '<path d="M58 78c0-34 84-34 84 0c-10-14-74-14-84 0z" fill="#2B2118"/>'
               '<path d="M30 200c6-48 34-66 70-66s64 18 70 66z" fill="#EE5AA0"/>')


FILES = {
    "donut_coconut": svg(donut(100, 100, 80, "#7A3B2E", "#F7A8CB")),
    "donut_strawberry": svg(donut(100, 100, 80, "#C7472F", "#5A2A22")),
    "donut_choco": svg(donut(100, 100, 80, "#5A3A22", "#F6C28B")),
    "donut_pink": svg(donut(100, 100, 80, "#F7A8CB")),
    "box_mistletoe": box(["#F7A8CB", "#fff", "#EE5AA0", "#fff", "#F7A8CB", "#B8E986"]),
    "box_christmas": box(["#E5484D", "#2EB67D", "#fff", "#E5484D", "#2EB67D", "#F2CE6B"]),
    "box_winter": box(["#A9DDF0", "#fff", "#5BCFEB", "#fff", "#A9DDF0", "#F7A8CB"]),
    "coffee_daigona": coffee(),
    "coffee_americano": coffee("#D9B38C", "#3B2416"),
    "cookies_set": cookies(),
    "avatar_member": avatar(),
}
for name, (c1, c2, ic) in {
    "banner_central": ("#6C4BD9", "#4A2FA8", "#F7A8CB"),
    "banner_hot": ("#5BCFEB", "#2FB4D6", "#EE5AA0"),
    "banner_festive": ("#FF7A1A", "#E5484D", "#fff"),
}.items():
    FILES[name] = banner(c1, c2, ic)
for name, roof in {"shop_myaynigone": "#EE5AA0", "shop_townships": "#5BCFEB",
                   "shop_central": "#FF7A1A", "shop_mall": "#6C4BD9"}.items():
    FILES[name] = shop(roof)
FILES["shop_myaynigone"] = shop("#EE5AA0")

for name, content in FILES.items():
    (OUT / f"{name}.svg").write_text(content)
print(f"wrote {len(FILES)} files to {OUT}")
