;;; prelude-coffee.el --- Emacs Prelude: CoffeeScript programming support.
;;
;; Copyright © 2011-2016 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; CoffeeScript is a nice little language that comples to JavaScript.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'prelude-programming)
(prelude-require-package 'coffee-mode)

(eval-after-load 'coffee-mode
  '(progn
     ;; CoffeeScript uses two spaces.
     (setq coffee-tab-width 2)

     ;; remove the "Generated by CoffeeScript" header
     (add-to-list 'coffee-args-compile "--no-header")

     (defun prelude-coffee-mode-defaults ()
       ;; Update the already compiled js on save
       (and (buffer-file-name)
            (file-exists-p (buffer-file-name))
            (file-exists-p (coffee-compiled-file-name (buffer-file-name)))
            (coffee-cos-mode t))
       (subword-mode +1))

     (setq prelude-coffee-mode-hook 'prelude-coffee-mode-defaults)

     (add-hook 'coffee-mode-hook (lambda ()
                                   (run-hooks 'prelude-coffee-mode-hook)))))
(provide 'prelude-coffee)

;;; prelude-coffee.el ends here
