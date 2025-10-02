@echo off
setlocal

echo =======================================
echo Coral BlackboxAI Agent - Build Script
echo =======================================
echo.

REM Get the directory where the script is located
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

echo Project directory: %SCRIPT_DIR%
echo.

REM Check if uv is installed
where uv >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo UV not found. Installing UV...
    
    REM Try to install via pip
    where pip >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo Installing UV using pip...
        pip install uv
    ) else (
        where pip3 >nul 2>&1
        if %ERRORLEVEL% EQU 0 (
            echo Installing UV using pip3...
            pip3 install uv
        ) else (
            echo Error: pip not found. Please install Python and pip first.
            exit /b 1
        )
    )
    
    echo UV installed successfully.
    echo.
)

REM Display UV version
uv --version
echo.

REM Create virtual environment if it doesn't exist
if not exist ".venv" (
    echo Creating virtual environment...
    uv venv .venv
    echo Virtual environment created.
    echo.
) else (
    echo Virtual environment already exists.
    echo.
)

REM Install dependencies
echo Installing dependencies...
uv sync
echo.

echo =======================================
echo Build completed successfully!
echo =======================================
echo.
echo To activate the virtual environment, run:
echo   .venv\Scripts\activate
echo.
echo To run the agent, use:
echo   uv run python main.py
echo.

endlocal
