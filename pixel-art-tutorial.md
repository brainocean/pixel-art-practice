# Pixel Art 系统自学教程（零基础）

> 来源：Lospec、saint11.art、Slynyrd 等一手资料整理
> 目标：从零到能独立完成游戏所需资产

---

## 第零步：准备工作

### 选软件（先做这件事）

| 软件 | 价格 | 推荐程度 |
|------|------|----------|
| [Aseprite](https://www.aseprite.org/) | $20 或自行编译（免费） | ★★★★★ 行业标准，专为像素艺术设计 |
| LibreSprite | 免费 | ★★★☆☆ Aseprite 旧版 fork |
| Lospec 在线编辑器 | 免费 | ★★☆☆☆ 测试用，不推荐长期使用 |

**Aseprite 许可证允许自行编译用于个人使用**，源码在 [GitHub](https://github.com/aseprite/aseprite)，官方提供预编译 Skia 库，构建约 15 分钟。购买的只是编译好的二进制。

### 设置 Aseprite 的两件事

1. 新建画布时选 **RGB Color Mode**，颜色深度 8-bit 或 RGBA
2. 学会快捷键：`B` 画笔 / `E` 橡皮 / `G` 填充 / `M` 选区 / `Ctrl+Z` 撤销

> 放大缩放默认就是 Nearest Neighbor，无需额外设置。

---

## 第一阶段：基础技术（第 1–2 周）

**目标：理解像素艺术的核心语言，能画出"干净"的线条。**

### 1.1 像素线条（Lines）

**为什么重要**：所有像素画都由线条构成，坏线条 = 坏作品。

**练习**：
- 用 1px 画笔画直线、斜线、曲线
- 掌握"正确斜线"规则：
  - 好：`████ ███ ██ █`（每段长度递减，均匀）
  - 坏：`██████ █ ████`（长度不均，产生"锯牙"）
- 练习画圆：先画轮廓，调整各段像素使轮廓对称

**资源**：
- Lospec - [Lines 标签教程](https://lospec.com/pixel-art-tutorials/tags/lines)
- saint11 - Fundamentals.gif（基础技法图解）

---

### 1.2 抗锯齿（Anti-Aliasing / AA）

**为什么重要**：让斜线和曲线看起来"平滑"，是区分新手和老手的关键。

**核心原理**：在主色和背景色之间，手动放置一个"中间色"像素来过渡。

```
无 AA（锯齿感强）：   有 AA（过渡自然）：
░░░░███               ░░░▒███
░░░███░               ░░▒██░░
░░███░░               ░▒██░░░
```

**练习**：
- 画一条 45° 以外角度的斜线，然后在锯齿处手动加 AA 像素
- 对比加/不加 AA 的效果

**注意**：不是所有像素画都需要 AA，1-bit 风格刻意不用。

---

### 1.3 调色板与色彩选择（Palette）

**为什么重要**：颜色选不好，技术再好也白搭；限制调色板是强制培养色感的最快方法。

**初学规则**：
- 限制自己使用 **8–16 色**
- 不要从头造调色板，直接用 Lospec 现成的经典调色板：
  - [DB16](https://lospec.com/palette-list/dawnbringer-16)（16色，非常适合初学）
  - [Pico-8](https://lospec.com/palette-list/pico-8)（16色，游戏感强）
  - [1-bit](https://lospec.com/palette-list/1bit-monitor-glow)（2色，极简练习）

**颜色基础**：
- 每个物体至少需要：**底色 + 阴影色 + 高光色**（3个层次）
- 阴影色：降低亮度，**同时偏蓝或偏紫**（不要直接加黑）
- 高光色：提高亮度，**同时偏黄或偏橙**（不要直接加白）

**资源**：
- [Lospec 调色板库](https://lospec.com/palette-list) — 直接下载，导入 Aseprite
- Luke Sadface - [Palettes Beginner Guide](https://lospec.com/pixel-art-tutorials/tags/palettes)

---

### 1.4 描边与轮廓（Outlines）

**规则**：
- 轮廓线通常是深色，但不一定是黑色（用深棕、深蓝更自然）
- 内轮廓（物体内部边界）颜色比外轮廓更浅
- 小尺寸（16px）：可以不用轮廓，靠颜色对比区分层次
- 大尺寸（32px+）：轮廓让形体更清晰

**资源**：saint11 - Outlines.gif

---

### 第一阶段练习作业

每天 30 分钟，按顺序完成：

| 天数 | 作业 | 画布尺寸 |
|------|------|----------|
| 第1–3天 | 临摹简单图标：苹果、心形、星星 | 16×16 |
| 第4–5天 | 画一颗宝石（注意 AA 和高光） | 16×16 |
| 第6–7天 | 用 DB16 调色板画一个角色头像 | 16×16 |

---

## 第二阶段：着色与光影（第 3–4 周）

**目标：让物体有立体感，能处理光源和阴影。**

### 2.1 基本着色技法

**光源**：决定一切。画之前先在脑子里固定光源位置（通常左上方）。

**着色步骤**：
1. 画轮廓
2. 填底色
3. 确定光源，用阴影色填背光区
4. 用高光色点亮受光区的最亮处
5. （进阶）加二级阴影（遮挡阴影）

**资源**：
- Pedro Medeiros (saint11) - Shading.gif
- Slynyrd - [Pixelblog 系列](https://www.slynyrd.com/blog)（大量 step-by-step 图解）

---

### 2.2 抖动（Dithering）

**用途**：用像素图案模拟颜色之间的渐变，在调色板有限的情况下增加色调层次。

**常见抖动模式**：
```
棋盘抖动（50%混合）：   渐变抖动：
█░█░█░                 ██████
░█░█░█                 █░█░██
█░█░█░                 ░░░░░█
```

**什么时候用**：颜色数量严格受限时（如 CGA、Game Boy 风格）；正常作品中不需要过度使用。

**资源**：Pixel Logic by Michael Azzi — dithering 章节（$9 付费书，值得买）

---

### 2.3 自发光与环境光

**自发光**：屏幕、火焰、魔法等会发出光的物体
- 技巧：让周围像素的颜色朝着发光物的颜色"偏移"

**环境光遮蔽（AO）**：物体接触面、角落的阴影更深
- 技巧：在两个物体接触的地方额外加一层深色

**资源**：saint11 - IlluminationTechniques.gif、Shine.gif

---

### 第二阶段练习作业

| 天数 | 作业 | 画布尺寸 |
|------|------|----------|
| 第1–3天 | 画一个球（用 3–5 色表现立体感） | 16×16 |
| 第4–5天 | 临摹一个岩石或宝箱 | 32×32 |
| 第6–7天 | 画一颗树（参考 Slynyrd 的 Modular Tree 教程） | 32×32 |

---

## 第三阶段：角色设计（第 5–6 周）

**目标：画出一个完整的角色 sprite。**

### 3.1 剪影优先（Silhouette First）

**最重要的原则**：好的角色靠剪影就能被认出来。

**流程**：
1. 先只用一个颜色画出角色轮廓
2. 确认剪影清晰、有辨识度
3. 再填细节

**资源**：saint11 - Silhouette.gif

---

### 3.2 小尺寸人物比例

**16×16 角色参考比例**（像素单位）：
- 头：4–5px 高
- 身体：5–6px
- 腿：4–5px
- 总高：14–16px

**32×32 角色更宽松**，可以加更多细节（脸部表情、装备细节等）。

---

### 3.3 像素角色的基本结构

**步骤**：
1. 草稿：用单色画轮廓
2. 底色：区分不同部位颜色（皮肤、衣服、头发）
3. 阴影：每个部位加阴影色
4. 高光：关键部位点高光
5. 轮廓：检查并修整轮廓线

**资源**：
- saint11 - Fundamentals2.gif、Portrait.gif
- Lospec - [Character 标签教程](https://lospec.com/pixel-art-tutorials/tags/character)

---

### 第三阶段练习作业

| 作业 | 说明 |
|------|------|
| 临摹一个已有游戏角色 | 从你喜欢的游戏截图中选一个简单角色临摹 |
| 设计一个原创角色 | 先画剪影，确认后填色 |
| 同一角色画 4 方向 | 正面、背面、左侧、右侧 |

---

## 第四阶段：基础动画（第 7–8 周）

**目标：让角色动起来，掌握 walk cycle。**

### 4.1 动画核心原则（12 原则精简版）

最重要的 4 个：
- **Squash and Stretch（挤压与拉伸）**：物体运动时形变，增加弹性感
- **Anticipation（预备动作）**：大动作前有反向小动作（跳跃前先下蹲）
- **Follow Through（跟随动作）**：主体停止后，部分细节继续运动（头发、尾巴）
- **Timing（节奏）**：帧间隔控制速度感

**资源**：
- [Alan Becker - 12 Principles of Animation](https://www.youtube.com/playlist?list=PL-bOh8btec4CXd2ya1NmSKpi92U_l6ZJd)（YouTube，非常直观）
- saint11 - Squash.gif、Easings.gif

---

### 4.2 Walk Cycle（行走循环）

**标准 8 帧 walk cycle 结构**：

```
帧: 1    2    3    4    5    6    7    8
   接地  上升  最高  下降  接地  上升  最高  下降
    右脚  右脚  右脚  右脚  左脚  左脚  左脚  左脚
```

**关键帧只画这几个**：
- 接触帧（Contact）：脚踩地的那一刻，重心最低
- 经过帧（Passing）：一只脚经过另一只脚，重心最高
- 下降帧（Down）：重心低点
- 上升帧（Up）：重心高点

**头部和躯干**：行走时上下轻微弹动（与步伐同频）

**资源**：
- Pedro Medeiros - Walk.gif（直接图解，极清晰）
- Lospec - [Walk Cycle 教程](https://lospec.com/pixel-art-tutorials/tags/walkcycle)

---

### 4.3 其他基础动画

按难度排序，按顺序练：

| 动画 | 难度 | 资源 |
|------|------|------|
| Idle（待机） | ★☆☆☆☆ | saint11 - characterIdle.gif |
| Walk Cycle（行走） | ★★☆☆☆ | saint11 - Walk.gif |
| Run Cycle（跑步） | ★★★☆☆ | saint11 - RunCycleSimple.gif |
| Jump（跳跃） | ★★☆☆☆ | saint11 - Jump.gif |
| Attack（攻击） | ★★★☆☆ | saint11 - AttackSheet.gif |

---

### 第四阶段练习作业

| 作业 | 帧数 | 说明 |
|------|------|------|
| 画一个 Idle 动画 | 2–4 帧 | 轻微上下浮动，眨眼 |
| 画一个 Walk Cycle | 4 帧（简版）或 8 帧 | 先从侧视角开始 |
| 画一个 Run Cycle | 4–6 帧 | 比 Walk 更弯腰，步幅更大 |

---

## 第五阶段：场景与环境（第 9–12 周）

**目标：画出 tile 和背景，能组合成完整场景。**

### 5.1 Tile（地砖/图块）

**Tile 设计规则**：
- 边缘要能无缝拼接（tileable）
- 同一 tileset 用同一调色板
- 保持一致的光源方向

**基础 Tile 种类**：
- 地面 tile
- 墙壁 tile（含法线方向：正面墙、侧面墙）
- 角落 tile（内角、外角）

**资源**：
- saint11 - Tiles.gif、Modular.gif
- Lospec - [Tiles 标签教程](https://lospec.com/pixel-art-tutorials/tags/tiles)

---

### 5.2 大气透视（Atmospheric Perspective）

**原理**：距离越远，颜色越：
- 饱和度低
- 亮度高（白天）
- 向天空色偏移（偏蓝）
- 细节少

**实际操作**：
1. 把画面分成 3–5 个深度层
2. 最近层：最饱和、最高对比
3. 最远层：接近天空颜色，几乎无细节

**资源**：Slynyrd - Pixelblog 62（景深背景教程，包含完整 step-by-step）

---

### 5.3 常见自然元素画法

| 元素 | 推荐资源 |
|------|----------|
| 树木 | Slynyrd - Modular Tree 教程；saint11 - Vegetation.gif 系列 |
| 岩石 | saint11 - Rock.gif |
| 水 | saint11 - Water.gif |
| 云 | Luke Sadface - Clouds Tutorial；saint11 - CLouds.gif |
| 草地 | Slynyrd - Pixelblog 62（Valley 场景详解） |
| 火 | saint11 - Fire.gif |

---

## 第六阶段：提升与进阶（持续）

### 6.1 学习循环（来自 Lospec）

反复执行这 4 步：
1. **练习**：每天画，量是质的基础
2. **学习**：有针对性地读教程解决具体短板
3. **获取反馈**：发到 [Lospec Discord](https://lospec.com/discord) 或 Reddit r/pixelart 求评
4. **研究**：找喜欢的像素画，在 Aseprite 里打开逐像素分析

### 6.2 进阶主题（掌握基础后）

| 主题 | 资源 |
|------|------|
| 等距视角（Isometric） | saint11 - Isometric.gif |
| 子像素动画（Subpixel） | saint11 - Subpixel.gif |
| 粒子效果（爆炸、烟雾） | saint11 - Explosion.gif、SmokeSheet.gif |
| 视差背景（Parallax） | saint11 - Parallax.gif；Slynyrd - Pixelblog 23 |
| UI 设计 | saint11 - UI-9-Slice.gif |
| 武器设计 | saint11 - Swords.gif、FirearmDesign.gif |

### 6.3 付费资源（值得投入）

- **[Pixel Logic](https://gumroad.com/l/pixel-logic)** by Michael Azzi — $9，最系统的像素艺术教材，涵盖线条、AA、着色、透视等所有基础
- **[PixelSchool.org](https://pixelschool.org)** — Lospec 官方课程，涵盖构图、色彩、阴影、透视

---

## 资源总索引

### 教程网站

| 资源 | 链接 | 说明 |
|------|------|------|
| Lospec 教程库 | https://lospec.com/pixel-art-tutorials | 500+ 篇，可按主题筛选 |
| Lospec 入门指南 | https://lospec.com/pixel-art-where-to-start | 初学者必读 |
| saint11 教程集 | https://saint11.art/blog/pixel-art-tutorials/ | 70+ 张图解教程，免费 |
| Slynyrd 博客 | https://www.slynyrd.com/blog | 60+ 期 Pixelblog，深度 walkthrough |

### 调色板

| 调色板 | 颜色数 | 适合阶段 |
|--------|--------|----------|
| [1-bit](https://lospec.com/palette-list/1bit-monitor-glow) | 2 | 练线条、剪影 |
| [DB8](https://lospec.com/palette-list/dawnbringer-8) | 8 | 初学限制练习 |
| [DB16](https://lospec.com/palette-list/dawnbringer-16) | 16 | 最推荐入门 |
| [Pico-8](https://lospec.com/palette-list/pico-8) | 16 | 游戏风格 |
| [Endesga 32](https://lospec.com/palette-list/endesga-32) | 32 | 进阶 |

### 社区

| 社区 | 说明 |
|------|------|
| [Lospec Discord](https://lospec.com/discord) | #feedback 频道可以求评 |
| [r/PixelArt](https://www.reddit.com/r/pixelart) | 发作品、找参考 |
| [PixelJoint](http://pixeljoint.com/) | 高质量画廊，值得临摹 |

### 中文 / 中文圈资源

> 中文系统资源较少，建议结合使用。saint11 的教程全为动图图解，**无需读英文**。

**B站视频（大陆）**

| 资源 | 链接 | 说明 |
|------|------|------|
| Aseprite 入门终极教程 | [BV1mQGCzSEUS](https://www.bilibili.com/video/BV1mQGCzSEUS) | 系统讲 Aseprite 操作，推荐入门先看 |
| 0基础手把手教你画画 | [BV16A41187zX](https://www.bilibili.com/video/BV16A41187zX) | 完整流程演示 |
| 笨办法学像素画（系列） | [bilibili opus](https://www.bilibili.com/opus/1005249121568686083) | 从画圆练起，文字+图解 |

**网站 / 博客（大陆）**

| 资源 | 链接 | 说明 |
|------|------|------|
| 像素熊老师 | [32comic.com](https://32comic.com/category/%E5%83%8F%E7%B4%A0%E7%94%BB%E6%95%99%E7%A8%8B) | 持续更新的中文教程汇总站 |
| 24天像素画从入门到放弃 | [frankorz.com](http://frankorz.com/2021/04/18/learn-pixel-art/) | 真实学习记录，避坑参考 |
| Steam 社区教程（直线/抖动） | [链接](https://steamcommunity.com/sharedfiles/filedetails?l=schinese&id=2095073211) | 有中文版的进阶技法图解 |

**繁中圈（质量更高）**

| 资源 | 链接 | 说明 |
|------|------|------|
| ⭐ 千穗系列教学 | [Plurk 集中贴](https://www.plurk.com/p/mnkh2s) | 最推荐。入门→食物→背景→游戏画面，信息密度极高，免费 |
| Los-muteki 像素美术实验室 | [YouTube](https://www.youtube.com/@los-muteki) | 台湾专门做像素画教学的频道，中文讲解 |

---

## 12 周学习路线图总览

```
第 1–2 周  基础技术
           ├─ 像素线条（直线、曲线、斜线规则）
           ├─ 抗锯齿手动处理
           ├─ 调色板选用（DB16）
           └─ 描边规范
               作业：16×16 图标 × 5

第 3–4 周  着色与光影
           ├─ 三色着色法（底色+阴影+高光）
           ├─ 抖动技法
           └─ 自发光与环境光
               作业：球体、宝箱、树

第 5–6 周  角色设计
           ├─ 剪影优先原则
           ├─ 小尺寸人物比例
           └─ 完整角色上色流程
               作业：临摹角色 + 原创角色 + 四方向

第 7–8 周  基础动画
           ├─ 动画 4 原则
           ├─ Walk Cycle（重点）
           └─ Idle + Run + Jump
               作业：完整角色动画集

第 9–12 周 场景与环境
           ├─ Tile 无缝拼接
           ├─ 大气透视
           └─ 自然元素（树/岩石/水/云）
               作业：完整游戏场景截图
```

---

*教程整理自 [Lospec](https://lospec.com)、[saint11.art](https://saint11.art)、[Slynyrd](https://www.slynyrd.com/blog) 等一手资源。*
