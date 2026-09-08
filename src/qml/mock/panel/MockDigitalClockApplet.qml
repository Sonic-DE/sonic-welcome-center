/*
 *  SPDX-FileCopyrightText: 2024 Oliver Beard <olib141@outlook.com>
 *
 *  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import QtQuick
import QtQuick.Layouts
import QtQml

import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PC3

import org.kde.plasma.welcome.private as Private

Private.MockAppletBase {
    id: applet

    implicitWidth: Math.max(timeLabel.width, dateLabel.paintedWidth)
                   + Kirigami.Units.largeSpacing

    // Fixes an issue where the applet is off by a single pixel
    // because the implicitWidth was 78.03125, and without setting
    // this, the width becomes 79 (even when set explicitly)
    Layout.preferredWidth: implicitWidth

    property date dateTime: new Date()
    property bool clockUpdatesEnabled: true

    Timer {
        interval: 1000
        repeat: true
        running: applet.clockUpdatesEnabled
        onTriggered: applet.dateTime = new Date()
    }

    PC3.Label {
        id: timeLabel
        anchors.top: applet.top
        anchors.topMargin: 8 // Margins separator
        anchors.horizontalCenter: applet.horizontalCenter

        width: paintedWidth
        height: 15.68 // Hardcoded from original
        font.pixelSize: 16 // Hardcoded from original

        text: Qt.formatTime(applet.dateTime)
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    PC3.Label {
        id: dateLabel
        objectName: "dateLabel"
        anchors.top: timeLabel.bottom
        anchors.horizontalCenter: timeLabel.horizontalCenter

        width: paintedWidth
        height: 12.544 // Hardcoded from original
        font.pixelSize: 13 // Hardcoded from original

        text: Qt.locale().toString(applet.dateTime, Locale.ShortFormat)
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
