rmdir Demo3.RemoteFeeds /S /Q
rmdir packages /S /Q
del Demo3.RemoteFeeds.sln
del Demo3.RemoteFeeds.v12.suo /A H

xcopy "DemoResetFiles\*" "..\" /E /I /H /Y