; AleoVM Library
;
; Copyright (C) 2025 Provable Inc.
;
; License: See the LICENSE file distributed with this library.
;
; Authors: Alessandro Coglio (www.alessandrocoglio.info)
;          Eric McCarthy (bendyarm on GitHub)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; This file contains specifications and proofs
; for the Aleo instruction operations:
;   and, is.eq, is.neq, nand, nor, not, or, ternary, and xor
; for boolean (single bit) arguments.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package "ALEOVM")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; These JSON forms were created from a variant snarkVM like this:
;
;/home/batman/.cargo/bin/cargo test --color=always --test boolean boolean --no-fail-fast --manifest-path /home/batman/snarkVM/circuit/Cargo.toml -- --format=json -Z unstable-options --show-output
;Testing started at 10:20 AM ...
;    Finished test [optimized + debuginfo] target(s) in 0.08s
;     Running tests/boolean.rs (target/debug/deps/boolean-a2f226d7de6ac186)

; Warning: the test output will not necessarily be in the same order as the tests.

(defconst *boolean-and-json*
#{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 3,
  "num_constraints": 3,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w0",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": [
        [
          "w2",
          "1"
        ]
      ]
    }
  ]
}
"""})
(defconst *boolean-equal-json*
 #{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 3,
  "num_constraints": 3,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w0",
          "2"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": [
        [
          "w1",
          "1"
        ],
        [
          "w0",
          "1"
        ],
        [
          "w2",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ]
      ]
    }
  ]
}
"""})
(defconst *boolean-nand-json*
#{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 3,
  "num_constraints": 3,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w0",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": [
        [
          "w2",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ]
    }
  ]
}
"""})
(defconst *boolean-nor-json*
#{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 3,
  "num_constraints": 3,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "c": [
        [
          "w2",
          "1"
        ]
      ]
    }
  ]
}
"""})
(defconst *boolean-not-json*
#{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 1,
  "num_constraints": 1,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    }
  ]
}
"""})
(defconst *boolean-or-json*
#{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 3,
  "num_constraints": 3,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "c": [
        [
          "w2",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ]
    }
  ]
}
"""})
(defconst *boolean-ternary-json*
#{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 4,
  "num_constraints": 4,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w2",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w2",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w0",
          "1"
        ]
      ],
      "b": [
        [
          "w2",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "w1",
          "1"
        ]
      ],
      "c": [
        [
          "w2",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "w3",
          "1"
        ]
      ]
    }
  ]
}
"""})
(defconst *boolean-xor-json*
#{"""
{
  "num_constants": 0,
  "num_public": 1,
  "num_private": 3,
  "num_constraints": 3,
  "is_satisfied": true,
  "constraints": [
    {
      "a": [
        [
          "w0",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w0",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w1",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ],
        [
          "ONE",
          "1"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": []
    },
    {
      "a": [
        [
          "w0",
          "2"
        ]
      ],
      "b": [
        [
          "w1",
          "1"
        ]
      ],
      "c": [
        [
          "w1",
          "1"
        ],
        [
          "w0",
          "1"
        ],
        [
          "w2",
          "8444461749428370424248824938781546531375899335154063827935233455917409239040"
        ]
      ]
    }
  ]
}
"""})
