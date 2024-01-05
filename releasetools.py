#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import common

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info)

def NoticeForPartitonUsers(info)
  OTA_InstallEnd(info)
  
def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)

def AddImage(info, basename, dest):
  path = "IMAGES/" + basename
  if path not in info.input_zip.namelist():
    return

  data = info.input_zip.read(path)
  common.ZipWriteStr(info.output_zip, basename, data)
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (basename, dest))

def OTA_InstallEnd(info):
  info.script.Print("Patching device-tree and verity images...")
  AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta")

def NoticeForPartitonUsers(info):
  info.script.Print("Notice: If you encounter any errors")
  info.script.Print("'please notify developer")
  info.script.Print("can provide information via support group")
  info.script.Print("Thanks for Support")
  info.script.Print("Have a nice day.")
  info.script.Print(" ")
  info.script.Print("If you are coming from a Dynamic partition ROM (please")
  info.script.Print("change your TWRP and Clean Flash), thank you.")
  info.script.Print("Linux Kernel 4.4 based ROM")
  info.script.Print(" ")
  info.script.Print(" ")
  info.script.Print("Enjoy!")
  info.script.Print("Yours, FebriCahyaa")
  info.script.Print("----------------------------------------------")    