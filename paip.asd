#|
  This file is a part of paip project.
  Copyright (c) 2016 Kabwe Chansa (kabw3.chansa@gmail.com)
|#

#|
  Author: Kabwe Chansa (kabw3.chansa@gmail.com)
|#

(in-package :cl-user)
(defpackage paip-asd
  (:use :cl :asdf))
(in-package :paip-asd)

(defsystem paip
  :version "0.1"
  :author "Kabwe Chansa"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "paip"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op paip-test))))
