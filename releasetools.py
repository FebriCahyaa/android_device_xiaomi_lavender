# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011, The Linux Foundation. All rights reserved.
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
import re

def FullOTA_InstallEnd(info):
  input_zip = info.input_zip
  NoticeForPartitonUsers(info)
  OTA_InstallEnd(info, input_zip)
  return

def IncrementalOTA_InstallEnd(info):
  input_zip = info.target_zip
  OTA_InstallEnd(info, input_zip)
  return

def AddImage(info, input_zip, basename, dest):
  name = basename
  data = input_zip.read("IMAGES/" + basename)
  common.ZipWriteStr(info.output_zip, name, data)
  info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))


def OTA_InstallEnd(info, input_zip):
  AddImage(info, input_zip, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta")
  return
  
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