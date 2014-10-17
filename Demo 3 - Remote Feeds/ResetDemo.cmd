rmdir Demo3.RemoteFeeds /S /Q
rmdir packages /S /Q
del Demo3.RemoteFeeds.sln
del Demo3.RemoteFeeds.v12.suo /A H

xcopy "DemoResetFiles\Demo 3 - RemoteFeeds\*" "..\Demo 3 - Remote Feeds" /E /I /H /Y