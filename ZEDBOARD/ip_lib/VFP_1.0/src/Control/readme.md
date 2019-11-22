External source d5m camera asserts ifval signal active high and then ilval signal active high with valid pixel 12 bits raw data to the CameraRawData module with pixclk souce clock. Then process d5mDataSyncP inside CameraRawData module starts loading syncronized pixel data into  line data buffer of maximum supported image width.Maximum image width is configured as constant value of 3741.Image width values varies which is adjusted by camera control valid signals upto maximum supported value. 

State machine "d5mStates" in CameraRawData module is main state machine which get frame valids signals and generate synchronized rLine,pSof,pEof cordx and cordy signals to system clock.

Finally in CameraRawData module, generated signals are streamed out as outputs from d5mP process to other modules.
