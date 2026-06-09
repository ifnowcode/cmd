@echo off
if /i (%echoval%) EQU (on) @echo on
setlocal

@echo Searching Macros ...
doskey /macros  | findstr /b /i "%1="

@echo Searching DOS Help ...
help | findstr /b /i /c:"%1 "

@echo Searching Path for %PATHEXT% ...
set temppath2=%path:"=%
set temppath="%temppath2:;=";"%"
@rem @echo TEMPPATH %temppath%
set tempext2=%PATHEXT:"=%
set tempext="%tempext2:;=".;"%"
@rem @echo TEMPEXT %tempext%
for %%a in (%temppath%) do (
  @rem @echo Searching %%a for %tempext%
  for %%x in (%tempext%) do (
    @rem @echo %%~a\%~1%%~x
    if exist %%~a\%~1%%~x (
      dir %%~a\%~1%%~x
    )
  )
)
@rem -----------------------------------------------------------------------
@rem
@rem  <|:) Wizard
@rem
@rem -----------------------------------------------------------------------
