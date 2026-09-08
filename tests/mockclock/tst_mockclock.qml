// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick
import QtQml
import QtTest

Item {
    id: clock
    width: 320
    height: 120

    property date dateTime: new Date()

    Text {
        id: dateLabel
        text: Qt.locale().toString(clock.dateTime, Locale.ShortFormat)
    }

    Timer {
        interval: 50
        running: true
        repeat: true
        onTriggered: clock.dateTime = new Date(clock.dateTime.getTime() + 1000)
    }

    TestCase {
        name: "MockClock"
        when: windowShown

        function test_usesCurrentLocaleShortDate() {
            compare(dateLabel.text, Qt.locale().toString(clock.dateTime, Locale.ShortFormat))
            verify(dateLabel.text.length > 0)
        }

        function test_timerAdvancesDisplayedTime() {
            const before = clock.dateTime
            tryVerify(() => clock.dateTime.getTime() > before.getTime(), 1000)
        }
    }
}
