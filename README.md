# Succulent · 肉肉桌面宠物

肉肉 RouRou 是一只粉尖绿叶、住在陶土花盆里的多肉伙伴，使用 Codex 桌面端的宠物系统。

![肉肉待机预览](previews/idle.gif)

## 能做什么

支持9种标准动作：待机眨眼、向右移动、向左移动、挥手、小跳、失败反应、等待输入、任务处理中、检查结果；另有16个视线方向。动作触发由客户端控制。

动画资源已通过本机结构、透明边缘、动作及方向检查，安装脚本已在 macOS 运行成功。应用内显示与兼容性仍需在你的客户端版本确认。

## 安装

适用于支持本地自定义 v2 宠物的 macOS 桌面客户端；网页端不会自动加载本机文件。

**方式一：下载 ZIP**

点击仓库 **Code → Download ZIP**，解压后在该目录打开终端，执行：

    bash install.sh

**方式二：一条命令（需要 Git）**

    git clone https://github.com/AbelChange/succulent-pet-codex.git && bash succulent-pet-codex/install.sh

安装完成后：

1. 打开应用 **设置 → Pets → Refresh（刷新）**。
2. 选择 **肉肉 RouRou**。
3. 在聊天中输入 **/pet** 显示桌面宠物。

脚本安装到本地 pets/rourou 目录，不需要管理员权限，不会自动激活，也不会覆盖已有的肉肉。已有其他宠物可以继续使用。

安装成功只表示资源已复制，仍需要手动选择和显示宠物。详细检查步骤见 [安装排查](docs/安装排查.md)。

## 常见问题

- **列表中没有肉肉**：先刷新宠物列表；仍没有时，完全退出桌面应用再打开。检查客户端是否支持 v2 自定义宠物。
- **提示肉肉已存在**：脚本为保护已有素材而停止，直接到宠物列表选择已有的肉肉。
- **网页端看不到**：桌面本地安装不会自动同步到网页；此包针对桌面 v2 格式。
- **下载后没有 pet/pet.json**：该分支或版本没有完整动画包，请使用包含 pet/ 资源的主分支或版本。

## 预览与素材

- [挥手](previews/waving.gif) · [小跳](previews/jumping.gif) · [工作](previews/running.gif) · [等待输入](previews/waiting.gif)
- [完整动作图](previews/contact-sheet-extended.png) · [16方向视线图](previews/look-directions.png)
- pet/：可安装资源及校验文件。
- assets/：角色设定和16表情参考原图。
- docs/：制作规格与发布说明。
- qa/：可检查的验证记录。
