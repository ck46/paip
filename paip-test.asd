#|
  This file is a part of paip project.
  Copyright (c) 2016 Kabwe Chansa (kabw3.chansa@gmail.com)
|#

(in-package :cl-user)
(defpackage paip-test-asd
  (:use :cl :asdf))
(in-package :paip-test-asd)

(defsystem paip-test
  :author "Kabwe Chansa"
  :license ""
  :depends-on (:paip
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "paip"))))
  :description "Test system for paip"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
