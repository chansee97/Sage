# Sage 游戏引擎

一个使用 C++ 开发的现代游戏引擎，专注于性能和易用性。

## 功能特性

- 🏗️ **模块化架构**: 清晰的应用程序框架和入口点系统
- 📝 **高性能日志系统**: 集成 spdlog 提供高效的日志记录功能
- 🎯 **客户端-引擎分离**: 明确的引擎核心和客户端应用分离设计
- 📦 **简单易用**: 提供简洁的 API 和示例应用

## 项目结构

```
Sage/                       # 游戏引擎核心
├── src/
│   ├── Sage.h             # 主引擎头文件 (客户端包含入口)
│   └── Sage/              # 引擎核心组件
│       ├── Application.h   # 应用程序基类
│       ├── Application.cpp 
│       ├── Core.h         # 核心定义和宏
│       ├── EntryPoint.h   # 程序入口点
│       ├── Log.h          # 日志系统头文件
│       └── Log.cpp        # 日志系统实现
├── vendor/                # 第三方依赖
│   └── spdlog/           # 高性能日志库
└── Sage.vcxproj          # Visual Studio 项目文件

SandBox/                   # 示例应用程序
├── src/
│   └── SandboxApp.cpp    # 示例应用实现
└── SandBox.vcxproj       # 示例项目文件

bin/                      # 输出可执行文件
bin-int/                  # 中间构建文件
Sage.sln                  # Visual Studio 解决方案文件
```

## 快速开始

### 系统要求

- Windows 10/11
- Visual Studio 2019 或更高版本
- C++17 或更高标准

### 构建步骤

1. **克隆仓库**
   ```bash
   git clone --recursive <repository-url>
   cd Sage
   ```

2. **打开解决方案**
   使用 Visual Studio 打开 `Sage.sln` 文件

3. **构建项目**
   - 选择构建配置 (Debug/Release)
   - 构建解决方案 (Ctrl+Shift+B)

### 使用示例

创建一个新的 Sage 应用程序：

```cpp
#include "Sage.h"

class MyApp : public Sage::Application
{
public:
    MyApp()
    {
        SAGE_INFO("应用程序启动");
    }

    ~MyApp()
    {
        SAGE_INFO("应用程序关闭");
    }
};

// 引擎入口点
Sage::Application* Sage::CreateApplication()
{
    return new MyApp();
}
```

## 日志系统

Sage 引擎提供了强大的日志系统，支持多个日志级别：

```cpp
// 引擎核心日志
SAGE_CORE_TRACE("跟踪信息");
SAGE_CORE_INFO("普通信息");
SAGE_CORE_WARN("警告信息");
SAGE_CORE_ERROR("错误信息");
SAGE_CORE_FATAL("致命错误");

// 客户端应用日志
SAGE_TRACE("应用跟踪");
SAGE_INFO("应用信息");
SAGE_WARN("应用警告");
SAGE_ERROR("应用错误");
SAGE_FATAL("应用致命错误");
```
