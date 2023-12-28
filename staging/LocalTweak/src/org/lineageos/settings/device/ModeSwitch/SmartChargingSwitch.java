/*
 * Copyright (C) 2023 FebriCahyaa
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */

package org.lineageos.settings.device.ModeSwitch;

import android.app.Service;
import android.content.IntentFilter;
import android.content.Intent;
import android.content.Context;
import android.content.SharedPreferences;
import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceManager;
import android.os.UserHandle;
import android.util.Log;

import org.lineageos.settings.device.LocalTweaks;
import org.lineageos.settings.device.Utils;

public class SmartChargingSwitch implements OnPreferenceChangeListener {

    private static Context mContext;

    public SmartChargingSwitch(Context context) {
        mContext = context;
    }

    private static final String FILE = "/sys/class/power_supply/battery/charging_enabled";

    public static String getFile() {
        if (Utils.fileWritable(FILE)) {
            return FILE;
        }
        return null;
    }

    public static boolean isSupported() {
        return Utils.fileWritable(getFile());
    }

    public static boolean isCurrentlyEnabled(Context context) {
        return Utils.getFileValueAsBoolean(getFile(), false);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Boolean enabled = (Boolean) newValue;
        Intent SmartChargingSVC = new Intent(mContext, org.lineageos.settings.device.SmartChargingService.class);
        if (enabled) {
            mContext.startServiceAsUser(SmartChargingSVC, UserHandle.CURRENT);
            LocalTweaks.mSeekBarPreference.setEnabled(true);
            LocalTweaks.mResetStats.setEnabled(true);
            Log.d("LocalTweaks", "Starting SmartChargingSVC");
        } else {
            mContext.stopServiceAsUser(SmartChargingSVC, UserHandle.CURRENT);
            LocalTweaks.mSeekBarPreference.setEnabled(false);
            LocalTweaks.mResetStats.setEnabled(false);
            Utils.writeValue(FILE, "1");
            Log.d("LocalTweaks", "Stopping SmartChargingSVC");
        }
        //Utils.writeValue(getFile(), enabled ? "1" : "0");
        return true;
    }
}
