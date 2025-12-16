breed [people person]

people-own [
  state        ;; "S" "I" "R"
  infected-at  ;; tick en el que se infectó
]

;; -----------------
;; SETUP
;; -----------------
to setup
  clear-all
  reset-ticks

  create-people num-people [
    setxy random-xcor random-ycor
    set state "S"
    set color blue
  ]

  ;; infectamos a una persona inicial
  ask one-of people [
    set state "I"
    set infected-at ticks
    set color red
  ]
end

;; -----------------
;; GO
;; -----------------
to go
  tick
  ask people [
    move
    if state = "I" [
      infect-others
      recover-if-time
    ]
  ]
end

;; -----------------
;; BEHAVIOR
;; -----------------
to move
  rt random 50
  lt random 50
  fd 1
end

to infect-others
  ask other people in-radius 1 [
    if state = "S" [
      if random-float 1 < infection-probability [
        set state "I"
        set infected-at ticks
        set color red
      ]
    ]
  ]
end

to recover-if-time
  if ticks - infected-at > recovery-time [
    set state "R"
    set color gray
  ]
end

;; -----------------
;; PLOTS
;; -----------------
to update-plot
  set-current-plot "Epidemic"
  set-current-plot-pen "Susceptible"
  plot count people with [state = "S"]
  set-current-plot-pen "Infected"
  plot count people with [state = "I"]
  set-current-plot-pen "Recovered"
  plot count people with [state = "R"]
end
