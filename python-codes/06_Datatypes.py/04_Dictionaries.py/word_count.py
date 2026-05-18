# Program to count the frequency of each word in a sentence

sentence = input("Enter a sentence: ").lower()
words = sentence.split()

word_frequency = {}

for word in words:
    if word in word_frequency:
        word_frequency[word] += 1
    else:
        word_frequency[word] = 1

print("\nWord Frequency:")
for word, count in word_frequency.items():
    print(word, ":", count)
