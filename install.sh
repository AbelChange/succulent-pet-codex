#!/bin/bash
set -euo pipefail
fail() { printf '%s\n' "$*" >&2; exit 1; }
[[ "$(uname -s)" == Darwin ]] || fail '当前安装脚本仅支持 macOS。'
# Install from a downloaded repository; no remote code execution or sudo needed.
root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_dir="$root/pet"
[[ -f "$source_dir/pet.json" ]] || fail '尚未发布正式宠物动画包：缺少 pet/pet.json。设计预览不能安装。'
[[ ! -L "$source_dir/pet.json" ]] || fail '拒绝符号链接。'
/usr/bin/plutil -lint "$source_dir/pet.json" >/dev/null || fail 'pet.json 格式错误。'
id="$(/usr/bin/plutil -extract id raw -o - "$source_dir/pet.json")"
version="$(/usr/bin/plutil -extract spriteVersionNumber raw -o - "$source_dir/pet.json")"
sprite="$(/usr/bin/plutil -extract spritesheetPath raw -o - "$source_dir/pet.json")"
[[ "$id" == rourou ]] || fail '宠物 id 必须为 rourou。'
[[ "$version" == 2 ]] || fail '只支持 v2 宠物。'
[[ "$sprite" == spritesheet.png || "$sprite" == spritesheet.webp ]] || fail '精灵图文件名不符合发布约定。'
[[ -f "$source_dir/$sprite" && ! -L "$source_dir/$sprite" ]] || fail '缺少正式精灵图。'
[[ -f "$source_dir/SHA256SUMS" ]] || fail '缺少发布校验文件。'
(cd "$source_dir" && /usr/bin/shasum -a 256 -c SHA256SUMS) || fail '文件校验失败。'
# Production artwork must already pass hatch-pet validation before release.
width="$(/usr/bin/sips -g pixelWidth "$source_dir/$sprite" | /usr/bin/awk '/pixelWidth:/{print $2}')"
height="$(/usr/bin/sips -g pixelHeight "$source_dir/$sprite" | /usr/bin/awk '/pixelHeight:/{print $2}')"
[[ "$width" == 1536 && "$height" == 2288 ]] || fail '精灵图必须为1536×2288。'
pet_home="${CODEX_HOME:-$HOME/.codex}/pets"
mkdir -p "$pet_home"
[[ ! -e "$pet_home/rourou" && ! -L "$pet_home/rourou" ]] || fail '肉肉已存在；为保留原素材，本脚本不会覆盖。'
stage="$(mktemp -d "$pet_home/.rourou-install.XXXXXX")"
trap 'rm -rf -- "$stage"' EXIT
cp "$source_dir/pet.json" "$source_dir/$sprite" "$stage/"
mv -n "$stage" "$pet_home/rourou"
printf '%s\n' '已安装肉肉；请在 Codex 的宠物选择界面选择。天气联动不包含在此安装包内。'
