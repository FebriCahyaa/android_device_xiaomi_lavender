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
package org.lineageos.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.provider.Settings;
import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceManager;

import org.lineageos.settings.device.LocalTweaks;

public class Touchboost implements OnPreferenceChangeListener {

    private Context mContext;

    public Touchboost(Context context) {
        mContext = context;
    }

    public static String getFile() {
        if (FileUtils.fileWritable(LocalTweaks.MSM_TOUCHBOOST_PATH)) {
            return LocalTweaks.MSM_TOUCHBOOST_PATH;
        }
        return null;
    }

    public static boolean isSupported() {
        return FileUtils.fileWritable(getFile());
    }

    public static boolean isCurrentlyEnabled(Context context) {
        return FileUtils.getFileValueAsBoolean(getFile(), false);
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object value) {
        final String key = preference.getKey();
        switch (key) {
            case LocalTweaks.PREF_MSM_TOUCHBOOST:
                FileUtils.setValue(LocalTweaks.MSM_TOUCHBOOST_PATH, (boolean) value);
                break;

            default:
                break;
        }
        return true;
    }
}
