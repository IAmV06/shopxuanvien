<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes">
    <title>Hệ Thống Mở Hộp Quà Kim Cương</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary-gradient: linear-gradient(135deg, #ffd700 0%, #ffb347 100%);
            --bg-dark: #1e1e2f;
            --bg-medium: #2a2a40;
            --bg-light: #3a3a5a;
            --gold: #ffd700;
            --gold-light: #ffb347;
            --text-light: #fff;
            --text-muted: #aaa;
            --border-glow: 0 0 0 1px rgba(255,215,0,0.2);
            --shadow-glow: 0 5px 15px rgba(0,0,0,0.3);
        }

        body {
            background: linear-gradient(135deg, var(--bg-dark) 0%, var(--bg-medium) 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 10px;
            position: relative;
            overflow-x: hidden;
            width: 100%;
        }

        /* Hiệu ứng kim cương nền */
        body::before {
            content: '💎';
            position: fixed;
            font-size: clamp(50px, 15vw, 100px);
            opacity: 0.03;
            transform: rotate(-15deg);
            top: 5%;
            left: 2%;
            animation: floatDiamond 20s linear infinite;
            pointer-events: none;
            z-index: 0;
        }

        body::after {
            content: '💎';
            position: fixed;
            font-size: clamp(80px, 20vw, 150px);
            opacity: 0.03;
            transform: rotate(25deg);
            bottom: 5%;
            right: 2%;
            animation: floatDiamond 25s linear infinite reverse;
            pointer-events: none;
            z-index: 0;
        }

        @keyframes floatDiamond {
            0%, 100% { transform: rotate(-15deg) translateY(0); }
            50% { transform: rotate(-15deg) translateY(-20px); }
        }

        .container {
            background: rgba(30, 30, 47, 0.98);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.5), var(--border-glow);
            width: 100%;
            max-width: 1400px;
            min-height: calc(100vh - 20px);
            overflow: hidden;
            position: relative;
            z-index: 1;
            backdrop-filter: blur(10px);
            margin: 0 auto;
        }

        /* Auth Forms */
        .auth-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 20px);
            padding: 20px;
            width: 100%;
        }

        .auth-box {
            background: var(--bg-medium);
            padding: clamp(20px, 5vw, 40px);
            border-radius: 15px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3), var(--border-glow);
            backdrop-filter: blur(5px);
            animation: slideIn 0.5s ease;
            margin: 0 auto;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .auth-box h2 {
            text-align: center;
            margin-bottom: 30px;
            color: var(--text-light);
            font-size: clamp(20px, 6vw, 28px);
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 0 10px rgba(255,215,0,0.3);
            word-wrap: break-word;
        }

        .input-group {
            margin-bottom: 20px;
            width: 100%;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #ddd;
            font-weight: bold;
            font-size: clamp(14px, 4vw, 16px);
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid var(--bg-light);
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
            background: var(--bg-dark);
            color: var(--text-light);
            -webkit-appearance: none;
            appearance: none;
        }

        .input-group input:focus {
            border-color: var(--gold);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255,215,0,0.1);
        }

        .btn {
            width: 100%;
            padding: 14px;
            background: var(--primary-gradient);
            color: var(--bg-dark);
            border: none;
            border-radius: 8px;
            font-size: clamp(14px, 4vw, 16px);
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            -webkit-tap-highlight-color: transparent;
        }

        .btn:active {
            transform: scale(0.98);
        }

        .btn-small {
            padding: 8px 16px;
            font-size: 14px;
            width: auto;
            min-width: 80px;
        }

        .auth-switch {
            text-align: center;
            margin-top: 20px;
            color: var(--text-muted);
            font-size: clamp(13px, 3.5vw, 14px);
        }

        .auth-switch a {
            color: var(--gold);
            text-decoration: none;
            font-weight: bold;
        }

        /* Dashboard - Mobile First */
        .dashboard {
            display: none;
            min-height: calc(100vh - 20px);
            width: 100%;
        }

        /* Sidebar cho mobile */
        .sidebar {
            background: linear-gradient(135deg, var(--bg-medium) 0%, var(--bg-dark) 100%);
            color: white;
            padding: 15px;
            width: 100%;
            min-height: auto;
            float: none;
            position: relative;
            overflow: hidden;
            border-right: none;
            border-bottom: 1px solid rgba(255,215,0,0.1);
        }

        .sidebar::before {
            content: '💎';
            position: absolute;
            font-size: 150px;
            opacity: 0.03;
            bottom: -30px;
            right: -30px;
            transform: rotate(20deg);
            pointer-events: none;
        }

        .sidebar h3 {
            margin-bottom: 15px;
            font-size: clamp(18px, 5vw, 24px);
            position: relative;
            z-index: 1;
            color: var(--gold);
            text-shadow: 0 0 10px rgba(255,215,0,0.3);
            word-wrap: break-word;
        }

        .sidebar ul {
            list-style: none;
            position: relative;
            z-index: 1;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .sidebar li {
            padding: 12px 15px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            border: 1px solid transparent;
            font-size: clamp(13px, 3.5vw, 15px);
            flex: 1 1 auto;
            text-align: center;
            background: rgba(255,255,255,0.05);
            -webkit-tap-highlight-color: transparent;
        }

        .sidebar li:active {
            background: rgba(255,215,0,0.2);
        }

        .sidebar li.active {
            background: rgba(255,215,0,0.15);
            border-color: var(--gold);
            box-shadow: 0 0 20px rgba(255,215,0,0.2);
        }

        /* Main content */
        .main-content {
            width: 100%;
            padding: 20px;
            background: var(--bg-dark);
            min-height: auto;
        }

        .header {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 20px;
            animation: fadeInDown 0.5s ease;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        #sectionTitle {
            color: var(--gold);
            font-size: clamp(18px, 5vw, 24px);
            text-align: center;
            word-wrap: break-word;
        }

        .user-info {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 10px;
            background: var(--bg-medium);
            padding: 12px 15px;
            border-radius: 50px;
            box-shadow: var(--shadow-glow), var(--border-glow);
            width: 100%;
        }

        .user-info span {
            font-weight: bold;
            color: var(--gold);
            font-size: clamp(14px, 4vw, 18px);
            white-space: nowrap;
        }

        .balance {
            font-size: clamp(18px, 5vw, 24px);
            color: var(--gold);
            font-weight: bold;
            margin: 20px 0;
            text-align: center;
            animation: pulse 2s infinite;
            text-shadow: 0 0 10px rgba(255,215,0,0.3);
            word-wrap: break-word;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }

        .logout-btn {
            padding: 8px 20px;
            background: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
            font-size: clamp(13px, 3.5vw, 14px);
            -webkit-tap-highlight-color: transparent;
        }

        .logout-btn:active {
            transform: scale(0.95);
            background: #c82333;
        }

        /* Giftcode Section */
        .giftcode-section {
            background: var(--bg-medium);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            border: 1px solid rgba(255,215,0,0.2);
        }

        .giftcode-title {
            color: var(--gold);
            font-size: 18px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .giftcode-input-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        @media (min-width: 768px) {
            .giftcode-input-group {
                flex-direction: row;
            }
        }

        .giftcode-input {
            flex: 1;
            padding: 12px;
            border: 2px solid var(--bg-light);
            border-radius: 8px;
            background: var(--bg-dark);
            color: var(--text-light);
            font-size: 16px;
            text-transform: uppercase;
        }

        .giftcode-input:focus {
            border-color: var(--gold);
            outline: none;
        }

        .giftcode-btn {
            padding: 12px 24px;
            background: var(--primary-gradient);
            color: var(--bg-dark);
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            white-space: nowrap;
        }

        .giftcode-btn:active {
            transform: scale(0.95);
        }

        .giftcode-list {
            margin-top: 15px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }

        .giftcode-tag {
            background: var(--bg-light);
            padding: 5px 10px;
            border-radius: 5px;
            color: var(--gold);
            font-size: 12px;
            font-family: monospace;
            cursor: pointer;
            transition: all 0.3s;
            border: 1px solid transparent;
        }

        .giftcode-tag:hover,
        .giftcode-tag:active {
            border-color: var(--gold);
            transform: translateY(-2px);
        }

        /* Stats Cards - Responsive Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(min(100%, 200px), 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: linear-gradient(135deg, var(--bg-medium) 0%, var(--bg-dark) 100%);
            border-radius: 15px;
            padding: 20px 15px;
            text-align: center;
            border: 1px solid rgba(255,215,0,0.2);
            box-shadow: var(--shadow-glow);
        }

        .stat-card .value {
            font-size: clamp(20px, 6vw, 32px);
            font-weight: bold;
            color: var(--gold);
            margin: 10px 0;
            word-wrap: break-word;
        }

        .stat-card .label {
            color: var(--text-muted);
            font-size: clamp(12px, 3.5vw, 14px);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Gift Box Grid - Responsive */
        .giftbox-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(min(100%, 160px), 1fr));
            gap: 15px;
            margin: 20px 0;
            animation: fadeIn 1s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .giftbox-item {
            background: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
            border-radius: 15px;
            padding: 15px 10px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow-glow);
            border: 2px solid rgba(255,255,255,0.1);
            -webkit-tap-highlight-color: transparent;
        }

        .giftbox-item:active {
            transform: scale(0.98);
        }

        .giftbox-item.opened {
            background: linear-gradient(135deg, var(--bg-light) 0%, var(--bg-medium) 100%);
            filter: grayscale(0.8);
            opacity: 0.8;
            cursor: not-allowed;
        }

        .giftbox-item.opened:active {
            transform: none;
        }

        .giftbox-emoji {
            font-size: clamp(40px, 10vw, 60px);
            margin-bottom: 8px;
            display: block;
            filter: drop-shadow(0 0 10px rgba(255,215,0,0.3));
        }

        .giftbox-name {
            font-weight: bold;
            color: white;
            margin-bottom: 8px;
            font-size: clamp(13px, 3.5vw, 15px);
            word-wrap: break-word;
        }

        .giftbox-price {
            background: rgba(0,0,0,0.3);
            padding: 5px 8px;
            border-radius: 20px;
            color: var(--gold);
            font-weight: bold;
            font-size: clamp(12px, 3vw, 13px);
            display: inline-block;
        }

        .giftbox-message {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0,0,0,0.8);
            color: var(--gold);
            padding: 6px;
            font-size: clamp(10px, 2.8vw, 11px);
            font-style: italic;
            border-bottom-left-radius: 13px;
            border-bottom-right-radius: 13px;
            transform: translateY(100%);
            transition: transform 0.3s;
            text-align: center;
            border-top: 1px solid var(--gold);
        }

        .giftbox-item.opened:hover .giftbox-message,
        .giftbox-item.opened:active .giftbox-message {
            transform: translateY(0);
        }

        /* History Section - Responsive */
        .history-container {
            background: var(--bg-medium);
            border-radius: 15px;
            padding: 20px;
            margin-top: 20px;
            border: 1px solid rgba(255,215,0,0.2);
            width: 100%;
            overflow-x: auto;
        }

        .history-title {
            color: var(--gold);
            font-size: clamp(16px, 4.5vw, 20px);
            margin-bottom: 15px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 10px;
        }

        .history-list {
            max-height: 400px;
            overflow-y: auto;
            -webkit-overflow-scrolling: touch;
        }

        .history-item {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 8px;
            padding: 12px;
            border-bottom: 1px solid var(--bg-light);
            animation: slideInRight 0.3s ease;
            background: rgba(255,215,0,0.02);
            border-radius: 10px;
            margin-bottom: 5px;
        }

        .history-time {
            color: var(--text-muted);
            font-size: clamp(10px, 2.8vw, 11px);
            min-width: 70px;
        }

        .history-box {
            background: var(--bg-light);
            padding: 5px 10px;
            border-radius: 20px;
            color: white;
            font-size: clamp(11px, 3vw, 12px);
            min-width: 120px;
            word-wrap: break-word;
        }

        .history-reward {
            color: var(--gold);
            font-weight: bold;
            font-size: clamp(11px, 3vw, 12px);
            min-width: 60px;
        }

        .history-message {
            color: var(--gold-light);
            font-size: clamp(10px, 2.8vw, 11px);
            font-style: italic;
            flex: 1;
            min-width: 150px;
            word-wrap: break-word;
            text-align: left;
        }

        /* Tables - Responsive */
        .table-responsive {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            margin: 15px 0;
        }

        table {
            width: 100%;
            min-width: 600px;
            background: var(--bg-medium);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: var(--shadow-glow);
            border: 1px solid rgba(255,215,0,0.2);
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 10px;
            text-align: left;
            border-bottom: 1px solid var(--bg-light);
            color: var(--text-light);
            font-size: clamp(12px, 3.5vw, 13px);
        }

        th {
            background: var(--primary-gradient);
            color: var(--bg-dark);
            font-weight: bold;
            white-space: nowrap;
        }

        /* Admin Settings - Responsive */
        .settings-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
            margin-top: 20px;
            width: 100%;
        }

        .setting-card {
            background: var(--bg-medium);
            padding: 20px;
            border-radius: 15px;
            box-shadow: var(--shadow-glow);
            border: 1px solid rgba(255,215,0,0.2);
            width: 100%;
            overflow-x: auto;
        }

        .giftbox-item-setting {
            background: var(--bg-light);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            border: 1px solid rgba(255,215,0,0.1);
            min-width: 280px;
        }

        @media (min-width: 768px) {
            .giftbox-item-setting {
                flex-direction: row;
                align-items: start;
            }
        }

        .giftbox-fields {
            display: grid;
            grid-template-columns: 1fr;
            gap: 10px;
            flex: 1;
            width: 100%;
        }

        @media (min-width: 480px) {
            .giftbox-fields {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .giftbox-message-field {
            grid-column: 1 / -1;
        }

        .giftbox-item-setting input, 
        .giftbox-item-setting textarea {
            padding: 8px;
            border: 2px solid var(--bg-medium);
            border-radius: 5px;
            font-size: clamp(12px, 3.5vw, 13px);
            background: var(--bg-dark);
            color: var(--text-light);
            width: 100%;
            -webkit-appearance: none;
            appearance: none;
        }

        .giftbox-item-setting textarea {
            resize: vertical;
            min-height: 50px;
        }

        .giftbox-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            justify-content: flex-start;
        }

        /* Modal - Responsive */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.9);
            justify-content: center;
            align-items: center;
            z-index: 2000;
            animation: fadeIn 0.3s;
            padding: 15px;
        }

        .modal-content {
            background: var(--bg-medium);
            padding: 25px 20px;
            border-radius: 20px;
            width: 100%;
            max-width: 500px;
            max-height: 80vh;
            overflow-y: auto;
            position: relative;
            animation: modalSlideIn 0.5s;
            border: 2px solid var(--gold);
            box-shadow: 0 0 50px rgba(255,215,0,0.2);
            -webkit-overflow-scrolling: touch;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-content h3 {
            margin-bottom: 20px;
            color: var(--gold);
            font-size: clamp(18px, 5vw, 22px);
            text-align: center;
            word-wrap: break-word;
        }

        .modal-message {
            background: var(--bg-light);
            padding: 15px;
            border-radius: 10px;
            margin: 15px 0;
            font-style: italic;
            color: var(--gold-light);
            text-align: center;
            font-size: clamp(14px, 4vw, 16px);
            border-left: 4px solid var(--gold);
            word-wrap: break-word;
        }

        .modal-buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        @media (min-width: 480px) {
            .modal-buttons {
                flex-direction: row;
            }
        }

        /* Notification */
        .notification {
            position: fixed;
            top: 15px;
            right: 15px;
            left: 15px;
            padding: 15px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            z-index: 3000;
            animation: notificationSlide 0.5s ease;
            text-align: center;
            font-size: clamp(13px, 3.5vw, 14px);
            word-wrap: break-word;
        }

        @media (min-width: 768px) {
            .notification {
                left: auto;
                min-width: 300px;
            }
        }

        @keyframes notificationSlide {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* Message collection */
        .message-collection {
            display: grid;
            grid-template-columns: 1fr;
            gap: 10px;
            margin-top: 20px;
            max-height: 300px;
            overflow-y: auto;
            -webkit-overflow-scrolling: touch;
        }

        @media (min-width: 480px) {
            .message-collection {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .message-preset {
            background: var(--bg-light);
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            border: 1px solid transparent;
            font-size: clamp(12px, 3.5vw, 13px);
            word-wrap: break-word;
            -webkit-tap-highlight-color: transparent;
        }

        .message-preset:active {
            background: var(--bg-medium);
            border-color: var(--gold);
            transform: translateY(-2px);
        }

        /* Utility classes */
        .text-center {
            text-align: center;
        }

        .mt-20 {
            margin-top: 20px;
        }

        .mb-20 {
            margin-bottom: 20px;
        }

        .w-100 {
            width: 100%;
        }

        /* Desktop styles */
        @media (min-width: 1024px) {
            body {
                padding: 20px;
                align-items: center;
            }

            .sidebar {
                width: 250px;
                min-height: calc(100vh - 40px);
                float: left;
                border-right: 1px solid rgba(255,215,0,0.1);
                border-bottom: none;
            }

            .sidebar ul {
                display: block;
            }

            .sidebar li {
                text-align: left;
                background: transparent;
            }

            .main-content {
                margin-left: 250px;
                width: calc(100% - 250px);
                min-height: calc(100vh - 40px);
            }

            .header {
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
            }

            #sectionTitle {
                text-align: left;
            }

            .user-info {
                width: auto;
            }

            .giftbox-grid {
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            }

            .giftbox-item:hover {
                transform: scale(1.05) translateY(-5px);
                box-shadow: 0 15px 30px rgba(255,215,0,0.2);
                border-color: var(--gold);
            }

            .giftbox-item:active {
                transform: scale(1.05) translateY(-5px);
            }

            .modal-buttons {
                flex-direction: row;
            }

            .notification {
                left: auto;
                min-width: 300px;
            }
        }

        /* Tablet styles */
        @media (min-width: 768px) and (max-width: 1023px) {
            .sidebar ul {
                flex-wrap: wrap;
            }
            
            .sidebar li {
                flex: 1 1 calc(50% - 5px);
            }
            
            .giftbox-grid {
                grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Auth Section -->
        <div id="authSection" class="auth-container">
            <div class="auth-box" id="loginForm">
                <h2>Đăng Nhập</h2>
                <div class="input-group">
                    <label>Tên đăng nhập</label>
                    <input type="text" id="loginUsername" placeholder="Nhập tên đăng nhập">
                </div>
                <div class="input-group">
                    <label>Mật khẩu</label>
                    <input type="password" id="loginPassword" placeholder="Nhập mật khẩu">
                </div>
                <button class="btn" onclick="login()">Đăng Nhập</button>
                <div class="auth-switch">
                    Chưa có tài khoản? <a href="#" onclick="showRegister()">Đăng ký</a>
                </div>
            </div>

            <div class="auth-box" id="registerForm" style="display: none;">
                <h2>Đăng Ký</h2>
                <div class="input-group">
                    <label>Tên đăng nhập</label>
                    <input type="text" id="regUsername" placeholder="Nhập tên đăng nhập">
                </div>
                <div class="input-group">
                    <label>Mật khẩu</label>
                    <input type="password" id="regPassword" placeholder="Nhập mật khẩu">
                </div>
                <div class="input-group">
                    <label>Xác nhận mật khẩu</label>
                    <input type="password" id="regConfirmPassword" placeholder="Xác nhận mật khẩu">
                </div>
                <button class="btn" onclick="register()">Đăng Ký</button>
                <div class="auth-switch">
                    Đã có tài khoản? <a href="#" onclick="showLogin()">Đăng nhập</a>
                </div>
            </div>
        </div>

        <!-- Dashboard Section -->
        <div id="dashboard" class="dashboard">
            <div class="sidebar">
                <h3>Xin chào, <span id="usernameDisplay"></span></h3>
                <ul>
                    <li class="active" onclick="showSection('profile')">Trang cá nhân</li>
                    <li onclick="showSection('game')">Kho Hộp Quà</li>
                    <li onclick="showSection('history')">Lịch Sử</li>
                    <li onclick="showSection('members')" id="adminMenu" style="display: none;">Quản lý thành viên</li>
                    <li onclick="showSection('giftboxSettings')" id="giftboxSettingsMenu" style="display: none;">Quản lý Hộp Quà</li>
                </ul>
            </div>
            <div class="main-content">
                <div class="header">
                    <h2 id="sectionTitle">Trang cá nhân</h2>
                    <div class="user-info">
                        <span>💎 <span id="userDiamonds">0</span> Kim Cương</span>
                        <span>💰 <span id="userBalance">0</span> VND</span>
                        <button class="logout-btn" onclick="logout()">Đăng xuất</button>
                    </div>
                </div>

                <!-- Giftcode Section - Hiển thị ở tất cả các trang -->
                <div class="giftcode-section">
                    <div class="giftcode-title">
                        <span>🎫 NHẬP GIFTCODE</span>
                        <span style="font-size: 12px; color: var(--text-muted);">Mỗi code chỉ dùng 1 lần</span>
                    </div>
                    <div class="giftcode-input-group">
                        <input type="text" class="giftcode-input" id="giftcodeInput" placeholder="Nhập mã giftcode..." maxlength="20" style="text-transform: uppercase;">
                        <button class="giftcode-btn" onclick="redeemGiftcode()">NHẬN THƯỞNG</button>
                    </div>
                    <div class="giftcode-list" id="giftcodeList"></div>
                </div>

                <!-- Profile Section -->
                <div id="profileSection">
                    <div class="setting-card">
                        <h3>Thông tin cá nhân</h3>
                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="label">Tên đăng nhập</div>
                                <div class="value" id="profileUsername"></div>
                            </div>
                            <div class="stat-card">
                                <div class="label">Số dư VND</div>
                                <div class="value" id="profileBalance">0</div>
                            </div>
                            <div class="stat-card">
                                <div class="label">Kim Cương</div>
                                <div class="value" id="profileDiamonds">0</div>
                            </div>
                        </div>
                        <div class="text-center mt-20">
                            <span style="color: #aaa;">Trạng thái: <span id="profileStatus"></span></span>
                        </div>
                    </div>
                </div>

                <!-- Game Section -->
                <div id="gameSection" style="display: none;">
                    <div class="balance">💎 Kim Cương hiện có: <span id="gameDiamonds">0</span></div>
                    
                    <div class="giftbox-grid" id="giftboxGrid"></div>

                    <!-- Confirmation Modal -->
                    <div id="openGiftModal" class="modal">
                        <div class="modal-content">
                            <h3>💎 Xác nhận mở hộp quà</h3>
                            <p id="giftConfirmMessage" style="font-size: 16px; margin: 20px 0; color: #fff;"></p>
                            <p style="color: gold; font-size: 14px; margin-bottom: 20px;">Bạn sẽ nhận được kim cương và lời nhắn bí mật!</p>
                            <div class="modal-buttons">
                                <button class="btn" onclick="confirmOpenGift()">Xác nhận mở</button>
                                <button class="btn" onclick="closeModal('openGiftModal')" style="background: #6c757d;">Hủy bỏ</button>
                            </div>
                        </div>
                    </div>

                    <!-- Result Modal -->
                    <div id="resultModal" class="modal">
                        <div class="modal-content" style="text-align: center;">
                            <h3 id="resultTitle">🎉 CHÚC MỪNG!</h3>
                            <div style="font-size: 80px; margin: 30px 0;" id="resultEmoji">💎</div>
                            <p id="resultMessage" style="font-size: 24px; margin: 20px 0; color: gold;"></p>
                            <div id="resultMessageText" class="modal-message"></div>
                            <button class="btn" onclick="closeModal('resultModal')">Tiếp tục</button>
                        </div>
                    </div>
                </div>

                <!-- History Section -->
                <div id="historySection" style="display: none;">
                    <div class="history-container">
                        <div class="history-title">
                            <span>📜 Lịch sử mở hộp quà</span>
                            <span style="margin-left: auto;">Tổng: <span id="historyCount">0</span></span>
                        </div>
                        <div class="history-list" id="historyList"></div>
                    </div>
                </div>

                <!-- Members Section -->
                <div id="membersSection" style="display: none;">
                    <h3 style="color: gold; margin-bottom: 20px;">Quản lý thành viên</h3>
                    <div class="table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>VND</th>
                                    <th>💎</th>
                                    <th>Trạng thái</th>
                                    <th>Vai trò</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody id="membersList"></tbody>
                        </table>
                    </div>
                </div>

                <!-- Giftbox Settings Section -->
                <div id="giftboxSettingsSection" style="display: none;">
                    <h3 style="color: gold; margin-bottom: 20px;">Quản lý hộp quà & Lời nhắn</h3>
                    
                    <div class="settings-grid">
                        <div class="setting-card">
                            <div style="display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; gap: 10px; margin-bottom: 20px;">
                                <h4>Danh sách 20 hộp quà</h4>
                                <div style="display: flex; flex-wrap: wrap; gap: 10px;">
                                    <button class="btn btn-small" onclick="showMessagePresets()" style="background: #17a2b8;">Mẫu lời nhắn</button>
                                    <button class="btn btn-small" onclick="resetGiftBoxes()" style="background: #17a2b8;">Reset</button>
                                </div>
                            </div>
                            <div id="giftBoxesSettings"></div>
                            <button class="btn btn-small" onclick="saveAllGiftBoxes()" style="margin-top: 20px; background: gold; color: #1e1e2f; width: 100%;">Lưu tất cả thay đổi</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Message Presets Modal -->
    <div id="messagePresetsModal" class="modal">
        <div class="modal-content">
            <h3>💬 Mẫu lời nhắn</h3>
            <p style="color: #aaa; margin-bottom: 20px;">Click để copy</p>
            <div class="message-collection" id="messagePresetsList"></div>
            <div class="modal-buttons">
                <button class="btn" onclick="closeModal('messagePresetsModal')" style="background: #6c757d;">Đóng</button>
            </div>
        </div>
    </div>

    <script>
        // Initialize data
        let currentUser = null;
        let currentEditingUser = null;
        let currentEditingType = null;
        let selectedGiftBox = null;
        
        // Users data
        let users = JSON.parse(localStorage.getItem('users')) || [];
        
        // Gift boxes data - 20 fixed boxes
        let giftBoxes = JSON.parse(localStorage.getItem('giftBoxes')) || [];

        // History data
        let openingHistory = JSON.parse(localStorage.getItem('openingHistory')) || [];

        // Giftcodes data
        let giftcodes = JSON.parse(localStorage.getItem('giftcodes')) || [];
        
        // Redeemed giftcodes history
        let redeemedGiftcodes = JSON.parse(localStorage.getItem('redeemedGiftcodes')) || [];

        // Message presets
        const messagePresets = [
            "Hãy luôn mỉm cười, vì cuộc sống tươi đẹp phía trước!",
            "Kim cương này sáng lấp lánh như nụ cười của bạn!",
            "Chúc bạn luôn may mắn và hạnh phúc!",
            "Đây là món quà từ vũ trụ gửi tặng bạn!",
            "Hãy tin vào điều kỳ diệu, nó luôn tồn tại!",
            "Bạn xứng đáng với những điều tốt đẹp nhất!",
            "Mỗi ngày là một cơ hội mới để tỏa sáng!",
            "Đừng bao giờ từ bỏ ước mơ của mình!",
            "Thành công đến từ những nỗ lực không ngừng!",
            "Hãy sống như viên kim cương, luôn tỏa sáng!",
            "Niềm vui hôm nay sẽ là kỷ niệm đẹp ngày mai!",
            "Bạn là người đặc biệt, đừng quên điều đó!",
            "Hạnh phúc là hành trình, không phải đích đến!",
            "Hãy lan tỏa yêu thương đến mọi người!",
            "Mỗi thử thách là một cơ hội để trưởng thành!",
            "Đừng so sánh mình với bất kỳ ai!",
            "Hãy tự hào về con người của bạn!",
            "Ước mơ không có giới hạn, hãy bay cao!",
            "Thời gian là vàng, hãy tận hưởng từng khoảnh khắc!",
            "Bạn mạnh mẽ hơn bạn nghĩ rất nhiều!"
        ];

        // Predefined giftcodes
        const predefinedGiftcodes = [
            // 5,000 VND - 5 codes
            { code: "A7B2R9X1", value: 5000 },
            { code: "K9L4M2P7", value: 5000 },
            { code: "Q1W8E3T5", value: 5000 },
            { code: "Z6X9C4V2", value: 5000 },
            { code: "B3N7M1K8", value: 5000 },
            
            // 10,000 VND - 5 codes
            { code: "H4J8K2L9", value: 10000 },
            { code: "Y1U7I3O5", value: 10000 },
            { code: "P6A0S4D2", value: 10000 },
            { code: "F8G2H9J1", value: 10000 },
            { code: "X5C3V7B4", value: 10000 },
            
            // 20,000 VND - 5 codes
            { code: "M2N8B4V6", value: 20000 },
            { code: "L1K7J3H9", value: 20000 },
            { code: "G5F0D4S2", value: 20000 },
            { code: "A8S2D6F3", value: 20000 },
            { code: "Q9W1E7R4", value: 20000 },
            
            // 50,000 VND - 5 codes
            { code: "T2Y8U4I6", value: 50000 },
            { code: "O1P7L3K9", value: 50000 },
            { code: "M5N0B4V2", value: 50000 },
            { code: "X8C2V6B3", value: 50000 },
            { code: "Z9A1S7D4", value: 50000 },
            
            // 100,000 VND - 5 codes
            { code: "F2G8H4J6", value: 100000 },
            { code: "K1L7P3O9", value: 100000 },
            { code: "I5U0Y4T2", value: 100000 },
            { code: "R8E2W6Q3", value: 100000 },
            { code: "M9N1B7V4", value: 100000 },
            
            // 200,000 VND - 5 codes
            { code: "S2D8F4G6", value: 200000 },
            { code: "H1J7K3L9", value: 200000 },
            { code: "X5C0V4B2", value: 200000 },
            { code: "N8M2Q6W3", value: 200000 },
            { code: "E9R1T7Y4", value: 200000 },
            
            // 500,000 VND - 5 codes
            { code: "U2I8O4P6", value: 500000 },
            { code: "A1S7D3F9", value: 500000 },
            { code: "G5H0J4K2", value: 500000 },
            { code: "L8K2Z6X3", value: 500000 },
            { code: "C9V1B7N4", value: 500000 }
        ];

        // Initialize giftcodes if empty
        if (giftcodes.length === 0) {
            giftcodes = [...predefinedGiftcodes];
            localStorage.setItem('giftcodes', JSON.stringify(giftcodes));
        }

        // Create default 20 gift boxes if empty
        if (giftBoxes.length === 0) {
            const diamondValues = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100, 120, 140, 160, 180, 200];
            for (let i = 0; i < 20; i++) {
                giftBoxes.push({
                    id: i + 1,
                    name: `Hộp quà bí ẩn ${i + 1}`,
                    price: 5000 + (i * 1000),
                    diamondValue: diamondValues[i],
                    message: messagePresets[i % messagePresets.length],
                    emoji: ['🎁', '🎀', '🎉', '🎊', '🧧', '🎄', '🎃', '🎈', '🎨', '🎭', '⭐', '🌟', '💫', '✨', '⚡', '🔥', '💎', '👑', '🏆', '🥇'][i % 20],
                    opened: false,
                    secret: true
                });
            }
            localStorage.setItem('giftBoxes', JSON.stringify(giftBoxes));
        }

        // Create admin account if not exists
        if (!users.find(u => u.username === 'admin')) {
            users.push({
                username: 'admin',
                password: 'admin123',
                balance: 100000,
                diamonds: 1000,
                status: 'active',
                role: 'admin'
            });
            localStorage.setItem('users', JSON.stringify(users));
        }

        // Create member accounts if not exists
        if (!users.find(u => u.username === 'vietdevien')) {
            users.push({
                username: 'vietdevien',
                password: 'vietchimbe',
                balance: 5000,
                diamonds: 0,
                status: 'active',
                role: 'member'
            });
        }

        if (!users.find(u => u.username === 'hungdevien')) {
            users.push({
                username: 'hungdevien',
                password: 'hungchimbe',
                balance: 5000,
                diamonds: 0,
                status: 'active',
                role: 'member'
            });
        }

        // Auth functions
        function showRegister() {
            document.getElementById('loginForm').style.display = 'none';
            document.getElementById('registerForm').style.display = 'block';
        }

        function showLogin() {
            document.getElementById('registerForm').style.display = 'none';
            document.getElementById('loginForm').style.display = 'block';
        }

        function register() {
            const username = document.getElementById('regUsername').value;
            const password = document.getElementById('regPassword').value;
            const confirmPassword = document.getElementById('regConfirmPassword').value;

            if (!username || !password) {
                showNotification('Vui lòng điền đầy đủ thông tin', 'error');
                return;
            }

            if (password !== confirmPassword) {
                showNotification('Mật khẩu xác nhận không khớp', 'error');
                return;
            }

            if (users.find(u => u.username === username)) {
                showNotification('Tên đăng nhập đã tồn tại', 'error');
                return;
            }

            users.push({
                username,
                password,
                balance: 10000,
                diamonds: 0,
                status: 'active',
                role: 'member'
            });

            localStorage.setItem('users', JSON.stringify(users));
            showNotification('Đăng ký thành công! Nhận ngay 10,000 VND', 'success');
            showLogin();
        }

        function login() {
            const username = document.getElementById('loginUsername').value;
            const password = document.getElementById('loginPassword').value;

            const user = users.find(u => u.username === username && u.password === password);

            if (!user) {
                showNotification('Tên đăng nhập hoặc mật khẩu không đúng', 'error');
                return;
            }

            if (user.status === 'locked') {
                showNotification('Tài khoản của bạn đã bị khóa', 'error');
                return;
            }

            currentUser = JSON.parse(JSON.stringify(user));
            document.getElementById('authSection').style.display = 'none';
            document.getElementById('dashboard').style.display = 'block';
            
            updateDashboard();
            showNotification(`Chào mừng ${username} quay trở lại!`, 'success');
        }

        function logout() {
            currentUser = null;
            document.getElementById('authSection').style.display = 'flex';
            document.getElementById('dashboard').style.display = 'none';
            document.getElementById('loginUsername').value = '';
            document.getElementById('loginPassword').value = '';
        }

        function updateDashboard() {
            document.getElementById('usernameDisplay').textContent = currentUser.username;
            document.getElementById('userBalance').textContent = currentUser.balance.toLocaleString();
            document.getElementById('userDiamonds').textContent = currentUser.diamonds || 0;
            
            document.getElementById('profileUsername').textContent = currentUser.username;
            document.getElementById('profileBalance').textContent = currentUser.balance.toLocaleString();
            document.getElementById('profileDiamonds').textContent = currentUser.diamonds || 0;
            document.getElementById('profileStatus').textContent = currentUser.status === 'active' ? 'Hoạt động' : 'Đã khóa';
            
            document.getElementById('gameDiamonds').textContent = currentUser.diamonds || 0;

            if (currentUser.role === 'admin') {
                document.getElementById('adminMenu').style.display = 'block';
                document.getElementById('giftboxSettingsMenu').style.display = 'block';
                loadMembers();
                loadGiftBoxesSettings();
            } else {
                document.getElementById('adminMenu').style.display = 'none';
                document.getElementById('giftboxSettingsMenu').style.display = 'none';
            }
            
            displayGiftBoxes();
            displayHistory();
            displayGiftcodeList();
        }

        function showSection(section) {
            document.getElementById('profileSection').style.display = 'none';
            document.getElementById('gameSection').style.display = 'none';
            document.getElementById('historySection').style.display = 'none';
            document.getElementById('membersSection').style.display = 'none';
            document.getElementById('giftboxSettingsSection').style.display = 'none';

            document.querySelectorAll('.sidebar li').forEach(li => li.classList.remove('active'));

            switch(section) {
                case 'profile':
                    document.getElementById('profileSection').style.display = 'block';
                    document.getElementById('sectionTitle').textContent = 'Trang cá nhân';
                    document.querySelector('.sidebar li:nth-child(1)').classList.add('active');
                    break;
                case 'game':
                    document.getElementById('gameSection').style.display = 'block';
                    document.getElementById('sectionTitle').textContent = 'Kho Hộp Quà';
                    document.querySelector('.sidebar li:nth-child(2)').classList.add('active');
                    displayGiftBoxes();
                    break;
                case 'history':
                    document.getElementById('historySection').style.display = 'block';
                    document.getElementById('sectionTitle').textContent = 'Lịch Sử';
                    document.querySelector('.sidebar li:nth-child(3)').classList.add('active');
                    displayHistory();
                    break;
                case 'members':
                    if (currentUser.role === 'admin') {
                        document.getElementById('membersSection').style.display = 'block';
                        document.getElementById('sectionTitle').textContent = 'Quản lý thành viên';
                        document.querySelector('.sidebar li:nth-child(4)').classList.add('active');
                        loadMembers();
                    }
                    break;
                case 'giftboxSettings':
                    if (currentUser.role === 'admin') {
                        document.getElementById('giftboxSettingsSection').style.display = 'block';
                        document.getElementById('sectionTitle').textContent = 'Quản lý hộp quà';
                        document.querySelector('.sidebar li:nth-child(5)').classList.add('active');
                        loadGiftBoxesSettings();
                    }
                    break;
            }
        }

        // Giftcode functions
        function displayGiftcodeList() {
            const list = document.getElementById('giftcodeList');
            if (!list) return;
            
            // Hiển thị vài code mẫu để người dùng biết (ẩn giá trị)
            const sampleCodes = giftcodes.slice(0, 5).map(g => g.code);
            list.innerHTML = sampleCodes.map(code => 
                `<span class="giftcode-tag" onclick="fillGiftcode('${code}')">${code}</span>`
            ).join('');
        }

        function fillGiftcode(code) {
            document.getElementById('giftcodeInput').value = code;
        }

        function redeemGiftcode() {
            if (!currentUser) return;
            
            const input = document.getElementById('giftcodeInput');
            const code = input.value.trim().toUpperCase();
            
            if (!code) {
                showNotification('Vui lòng nhập mã giftcode!', 'error');
                return;
            }

            // Kiểm tra code đã được sử dụng bởi user này chưa
            const userRedeemed = redeemedGiftcodes.find(r => 
                r.username === currentUser.username && r.code === code
            );
            
            if (userRedeemed) {
                showNotification('Bạn đã sử dụng mã này rồi!', 'error');
                return;
            }

            // Tìm code trong danh sách
            const giftcode = giftcodes.find(g => g.code === code);
            
            if (!giftcode) {
                showNotification('Mã giftcode không hợp lệ!', 'error');
                return;
            }

            // Cộng tiền cho user
            currentUser.balance += giftcode.value;
            
            // Lưu lịch sử đã dùng
            redeemedGiftcodes.push({
                username: currentUser.username,
                code: code,
                value: giftcode.value,
                time: new Date().toLocaleString('vi-VN')
            });
            
            // Xóa code khỏi danh sách (chỉ dùng 1 lần)
            giftcodes = giftcodes.filter(g => g.code !== code);
            
            // Cập nhật localStorage
            localStorage.setItem('giftcodes', JSON.stringify(giftcodes));
            localStorage.setItem('redeemedGiftcodes', JSON.stringify(redeemedGiftcodes));
            
            // Cập nhật user data
            updateUserData();
            
            // Refresh hiển thị
            updateDashboard();
            
            // Thông báo
            showNotification(`🎉 Nhận được ${giftcode.value.toLocaleString()} VND!`, 'success');
            
            // Xóa input
            input.value = '';
        }

        function displayGiftBoxes() {
            const grid = document.getElementById('giftboxGrid');
            grid.innerHTML = '';

            giftBoxes.forEach(box => {
                const boxDiv = document.createElement('div');
                boxDiv.className = `giftbox-item ${box.opened ? 'opened' : ''}`;
                if (!box.opened) {
                    boxDiv.onclick = () => showOpenGiftConfirm(box);
                }
                
                boxDiv.innerHTML = `
                    <span class="giftbox-emoji">${box.emoji}</span>
                    <div class="giftbox-name">${box.name}</div>
                    <div class="giftbox-price">💰 ${box.price.toLocaleString()} VND</div>
                    ${box.opened ? '<div class="giftbox-opened-label">ĐÃ MỞ</div>' : ''}
                    ${box.opened ? `<div class="giftbox-message">💬 "${box.message}"</div>` : ''}
                `;
                
                grid.appendChild(boxDiv);
            });
        }

        function showOpenGiftConfirm(box) {
            if (currentUser.balance < box.price) {
                showNotification('Số dư VND không đủ!', 'error');
                return;
            }

            selectedGiftBox = box;
            document.getElementById('giftConfirmMessage').innerHTML = `
                Mở <strong style="color: gold;">${box.name}</strong>?<br>
                <span style="color: #ff6b6b;">Giá: ${box.price.toLocaleString()} VND</span>
            `;
            document.getElementById('openGiftModal').style.display = 'flex';
        }

        function confirmOpenGift() {
            if (!selectedGiftBox) return;

            currentUser.balance -= selectedGiftBox.price;
            
            const diamondsEarned = selectedGiftBox.diamondValue;
            currentUser.diamonds = (currentUser.diamonds || 0) + diamondsEarned;
            
            const message = selectedGiftBox.message || "Chúc bạn may mắn!";
            
            const boxIndex = giftBoxes.findIndex(b => b.id === selectedGiftBox.id);
            giftBoxes[boxIndex].opened = true;
            
            const historyEntry = {
                id: Date.now(),
                username: currentUser.username,
                boxName: selectedGiftBox.name,
                diamonds: diamondsEarned,
                message: message,
                time: new Date().toLocaleString('vi-VN'),
                timestamp: Date.now()
            };
            openingHistory.unshift(historyEntry);
            
            updateUserData();
            localStorage.setItem('giftBoxes', JSON.stringify(giftBoxes));
            localStorage.setItem('openingHistory', JSON.stringify(openingHistory));
            
            closeModal('openGiftModal');
            
            showResult(diamondsEarned, message);
            
            displayGiftBoxes();
            document.getElementById('gameDiamonds').textContent = currentUser.diamonds;
            document.getElementById('userDiamonds').textContent = currentUser.diamonds;
            document.getElementById('profileDiamonds').textContent = currentUser.diamonds;
            
            createConfetti();
        }

        function showResult(diamonds, message) {
            document.getElementById('resultTitle').innerHTML = '💎 CHÚC MỪNG!';
            document.getElementById('resultEmoji').innerHTML = '💎';
            document.getElementById('resultMessage').innerHTML = `
                +${diamonds} Kim Cương
            `;
            document.getElementById('resultMessageText').innerHTML = `💬 "${message}"`;
            document.getElementById('resultModal').style.display = 'flex';
        }

        function displayHistory() {
            const historyList = document.getElementById('historyList');
            const historyCount = document.getElementById('historyCount');
            
            const userHistory = openingHistory.filter(h => h.username === currentUser.username);
            historyCount.textContent = userHistory.length;
            
            if (userHistory.length === 0) {
                historyList.innerHTML = '<p style="color: #aaa; text-align: center; padding: 20px;">Chưa có lịch sử</p>';
                return;
            }
            
            historyList.innerHTML = '';
            userHistory.forEach(entry => {
                const item = document.createElement('div');
                item.className = 'history-item';
                item.innerHTML = `
                    <span class="history-time">${entry.time.split(' ')[1] || entry.time}</span>
                    <span class="history-box">${entry.boxName}</span>
                    <span class="history-reward">+${entry.diamonds} 💎</span>
                    <span class="history-message">💬 ${entry.message.substring(0, 30)}${entry.message.length > 30 ? '...' : ''}</span>
                `;
                historyList.appendChild(item);
            });
        }

        function createConfetti() {
            for (let i = 0; i < 30; i++) {
                setTimeout(() => {
                    const confetti = document.createElement('div');
                    confetti.className = 'confetti';
                    confetti.style.left = Math.random() * 100 + '%';
                    confetti.style.background = `hsl(${Math.random() * 60 + 30}, 100%, 50%)`;
                    confetti.style.width = Math.random() * 8 + 3 + 'px';
                    confetti.style.height = confetti.style.width;
                    document.body.appendChild(confetti);
                    
                    setTimeout(() => confetti.remove(), 3000);
                }, i * 50);
            }
        }

        function loadMembers() {
            const membersList = document.getElementById('membersList');
            membersList.innerHTML = '';

            users.filter(u => u.username !== 'admin').forEach(user => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${user.username}</td>
                    <td>${user.balance.toLocaleString()}</td>
                    <td>${user.diamonds || 0}</td>
                    <td>${user.status === 'active' ? 'Hoạt động' : 'Đã khóa'}</td>
                    <td>${user.role}</td>
                    <td>
                        <button class="action-btn edit-btn" onclick="showEditUserModal('${user.username}', 'balance')">💰</button>
                        <button class="action-btn diamond-btn" onclick="showEditUserModal('${user.username}', 'diamonds')">💎</button>
                        <button class="action-btn lock-btn" onclick="toggleUserLock('${user.username}')">${user.status === 'active' ? '🔒' : '🔓'}</button>
                        <button class="action-btn delete-btn" onclick="deleteUser('${user.username}')">🗑️</button>
                    </td>
                `;
                membersList.appendChild(row);
            });
        }

        function showEditUserModal(username, type) {
            currentEditingUser = username;
            currentEditingType = type;
            
            const points = prompt(`Nhập số ${type === 'balance' ? 'VND' : 'Kim Cương'} mới cho ${username}:`, '0');
            if (points !== null) {
                const numPoints = parseInt(points);
                if (!isNaN(numPoints)) {
                    const userIndex = users.findIndex(u => u.username === username);
                    if (userIndex !== -1) {
                        if (type === 'balance') {
                            users[userIndex].balance = numPoints;
                        } else {
                            users[userIndex].diamonds = numPoints;
                        }
                        localStorage.setItem('users', JSON.stringify(users));
                        showNotification('Cập nhật thành công!', 'success');
                        loadMembers();
                    }
                }
            }
        }

        function toggleUserLock(username) {
            const userIndex = users.findIndex(u => u.username === username);
            if (userIndex !== -1) {
                users[userIndex].status = users[userIndex].status === 'active' ? 'locked' : 'active';
                localStorage.setItem('users', JSON.stringify(users));
                showNotification('Cập nhật trạng thái!', 'success');
                loadMembers();
            }
        }

        function deleteUser(username) {
            if (confirm('Xóa tài khoản này?')) {
                users = users.filter(u => u.username !== username);
                localStorage.setItem('users', JSON.stringify(users));
                showNotification('Đã xóa!', 'success');
                loadMembers();
            }
        }

        function loadGiftBoxesSettings() {
            const container = document.getElementById('giftBoxesSettings');
            container.innerHTML = '';
            
            giftBoxes.forEach(box => {
                const boxDiv = document.createElement('div');
                boxDiv.className = 'giftbox-item-setting';
                boxDiv.innerHTML = `
                    <span style="font-size: 40px;">${box.emoji}</span>
                    <div class="giftbox-fields">
                        <input type="text" value="${box.name}" placeholder="Tên hộp" data-id="${box.id}" data-field="name" class="giftbox-input">
                        <input type="number" value="${box.price}" placeholder="Giá VND" data-id="${box.id}" data-field="price" class="giftbox-input">
                        <input type="number" value="${box.diamondValue}" placeholder="Kim cương" data-id="${box.id}" data-field="diamondValue" class="giftbox-input">
                        <div class="giftbox-message-field">
                            <textarea placeholder="Lời nhắn" data-id="${box.id}" data-field="message" class="giftbox-input" rows="2">${box.message || ''}</textarea>
                        </div>
                    </div>
                    <div class="giftbox-actions">
                        <button class="action-btn edit-btn" onclick="updateGiftBoxEmoji(${box.id})">😊</button>
                        <button class="action-btn message-btn" onclick="showMessagePresetsForBox(${box.id})">💬</button>
                        <button class="action-btn delete-btn" onclick="resetGiftBox(${box.id})">↺</button>
                    </div>
                `;
                container.appendChild(boxDiv);
            });
        }

        function showMessagePresets() {
            const modal = document.getElementById('messagePresetsModal');
            const list = document.getElementById('messagePresetsList');
            
            list.innerHTML = '';
            messagePresets.forEach((message, index) => {
                const preset = document.createElement('div');
                preset.className = 'message-preset';
                preset.innerHTML = `💬 ${message.substring(0, 40)}${message.length > 40 ? '...' : ''}`;
                preset.onclick = () => {
                    navigator.clipboard.writeText(message);
                    showNotification('Đã copy!', 'success');
                };
                list.appendChild(preset);
            });
            
            modal.style.display = 'flex';
        }

        function showMessagePresetsForBox(boxId) {
            showMessagePresets();
        }

        function updateGiftBoxEmoji(boxId) {
            const emojis = ['🎁', '🎀', '🎉', '🎊', '🧧', '🎄', '🎃', '🎈', '🎨', '🎭', '⭐', '🌟', '💫', '✨', '⚡', '🔥', '💎', '👑', '🏆', '🥇'];
            const randomEmoji = emojis[Math.floor(Math.random() * emojis.length)];
            
            const boxIndex = giftBoxes.findIndex(b => b.id === boxId);
            if (boxIndex !== -1) {
                giftBoxes[boxIndex].emoji = randomEmoji;
                localStorage.setItem('giftBoxes', JSON.stringify(giftBoxes));
                showNotification('Đã cập nhật emoji!', 'success');
                loadGiftBoxesSettings();
                displayGiftBoxes();
            }
        }

        function resetGiftBox(boxId) {
            const boxIndex = giftBoxes.findIndex(b => b.id === boxId);
            if (boxIndex !== -1) {
                const diamondValues = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100, 120, 140, 160, 180, 200];
                giftBoxes[boxIndex] = {
                    id: boxId,
                    name: `Hộp quà bí ẩn ${boxId}`,
                    price: 5000 + ((boxId - 1) * 1000),
                    diamondValue: diamondValues[boxId - 1],
                    message: messagePresets[(boxId - 1) % messagePresets.length],
                    emoji: ['🎁', '🎀', '🎉', '🎊', '🧧', '🎄', '🎃', '🎈', '🎨', '🎭', '⭐', '🌟', '💫', '✨', '⚡', '🔥', '💎', '👑', '🏆', '🥇'][(boxId - 1) % 20],
                    opened: false,
                    secret: true
                };
                localStorage.setItem('giftBoxes', JSON.stringify(giftBoxes));
                showNotification('Đã reset!', 'success');
                loadGiftBoxesSettings();
                displayGiftBoxes();
            }
        }

        function resetGiftBoxes() {
            if (confirm('Reset tất cả hộp quà?')) {
                const diamondValues = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100, 120, 140, 160, 180, 200];
                for (let i = 0; i < 20; i++) {
                    giftBoxes[i] = {
                        id: i + 1,
                        name: `Hộp quà bí ẩn ${i + 1}`,
                        price: 5000 + (i * 1000),
                        diamondValue: diamondValues[i],
                        message: messagePresets[i % messagePresets.length],
                        emoji: ['🎁', '🎀', '🎉', '🎊', '🧧', '🎄', '🎃', '🎈', '🎨', '🎭', '⭐', '🌟', '💫', '✨', '⚡', '🔥', '💎', '👑', '🏆', '🥇'][i % 20],
                        opened: false,
                        secret: true
                    };
                }
                localStorage.setItem('giftBoxes', JSON.stringify(giftBoxes));
                showNotification('Đã reset!', 'success');
                loadGiftBoxesSettings();
                displayGiftBoxes();
            }
        }

        function saveAllGiftBoxes() {
            const inputs = document.querySelectorAll('.giftbox-input');
            
            inputs.forEach(input => {
                const boxId = parseInt(input.dataset.id);
                const field = input.dataset.field;
                let value = input.value;
                
                if (field === 'price' || field === 'diamondValue') {
                    value = parseInt(value) || 0;
                }
                
                const boxIndex = giftBoxes.findIndex(b => b.id === boxId);
                if (boxIndex !== -1) {
                    giftBoxes[boxIndex][field] = value;
                }
            });
            
            giftBoxes.forEach(box => box.opened = false);
            
            localStorage.setItem('giftBoxes', JSON.stringify(giftBoxes));
            showNotification('Đã lưu!', 'success');
            displayGiftBoxes();
        }

        function updateUserData() {
            const userIndex = users.findIndex(u => u.username === currentUser.username);
            if (userIndex !== -1) {
                users[userIndex].balance = currentUser.balance;
                users[userIndex].diamonds = currentUser.diamonds;
                localStorage.setItem('users', JSON.stringify(users));
            }
        }

        function showNotification(message, type = 'info') {
            const notification = document.createElement('div');
            notification.className = `notification ${type}`;
            notification.textContent = message;
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.remove();
            }, 2000);
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        }

        // Thêm CSS cho confetti
        const style = document.createElement('style');
        style.textContent = `
            .confetti {
                position: fixed;
                pointer-events: none;
                z-index: 9999;
                animation: confettiFall 3s linear forwards;
            }
            
            @keyframes confettiFall {
                0% {
                    transform: translateY(-10vh) rotate(0deg);
                    opacity: 1;
                }
                100% {
                    transform: translateY(100vh) rotate(720deg);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
