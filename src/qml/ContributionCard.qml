/*
 *  SPDX-FileCopyrightText: 2024 Oliver Beard <olib141@outlook.com>
 *  SPDX-FileCopyrightText: 2024 Nate Graham <nate@kde.org>
 *
 *  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2

import org.kde.kirigami as Kirigami

Kirigami.AbstractCard {
    contentItem: QQC2.Label {
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.Wrap
        text: xi18nc("@info:usagetip", "If you find SonicDE useful, consider getting involved. Your contributions to the SonicDE community make a real difference!")
    }

    footer: RowLayout {
        spacing: 0

        Item {
            Layout.fillWidth: true
        }

        // TODO: Donations are disabled until SonicDE has a donation destination.
        /*
        Kirigami.UrlButton {
            text: i18nc("@action:button", "Make a donation")
            url: "https://sonicde.org"
        }
        */

        Kirigami.UrlButton {
            text: i18nc("@action:button", "Get involved")
            url: "https://sonicde.org"
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
