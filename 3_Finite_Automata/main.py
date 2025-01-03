import re

class FiniteAutomaton:
    def __init__(self, states, alphabet, transitions, start_state, final_states):
        self.states = set(states)
        self.alphabet = set(alphabet)
        self.transitions = transitions  # Dictionary of dictionaries for state transitions
        self.start_state = start_state
        self.final_states = set(final_states)

    def display(self):
        print("Set of States:", self.states)
        print("Alphabet:", self.alphabet)
        print("Transitions:")
        for state, trans in self.transitions.items():
            for char, next_state in trans.items():
                print(f"  δ({state}, '{char}') -> {next_state}")
        print("Start State:", self.start_state)
        print("Set of Final States:", self.final_states)

    def is_valid_string(self, string):
        current_state = self.start_state
        for char in string:
            if char not in self.alphabet:
                return False
            if char in self.transitions[current_state]:
                current_state = self.transitions[current_state][char]
            else:
                return False
        return current_state in self.final_states


def read_fa(file_path):
    with open(file_path, "r") as file:
        lines = file.readlines()

    states = lines[0].strip().split(",")
    alphabet = lines[1].strip().split(",")
    start_state = lines[2].strip()
    final_states = lines[3].strip().split(",")

    transitions = {}
    for line in lines[4:]:
        state, char, next_state = line.strip().split(",")
        if state not in transitions:
            transitions[state] = {}
        transitions[state][char] = next_state

    return FiniteAutomaton(states, alphabet, transitions, start_state, final_states)


if __name__ == "__main__":
    fa_file = "FA.in"
    fa = read_fa(fa_file)

    print("Finite Automaton Components:")
    fa.display()

    # Validate a string
    test_string = input("\nEnter a string to check if it's a valid lexical token: ")
    if fa.is_valid_string(test_string):
        print(f"'{test_string}' is a valid lexical token.")
    else:
        print(f"'{test_string}' is not a valid lexical token.")
