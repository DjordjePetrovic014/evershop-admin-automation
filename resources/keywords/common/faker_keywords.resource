*** Settings ***
Library    FakerLibrary

*** Keywords ***
Generate Fake Word
    [Documentation]    Returns one fake word from FakerLibrary.
    ${fake_word}=    Word
    RETURN    ${fake_word}

Generate Fake Sentence
    [Documentation]    Returns fake sentence with requested word count.
    [Arguments]    ${nb_words}
    ${fake_sentence}=    Sentence    nb_words=${nb_words}
    RETURN    ${fake_sentence}

Generate Unique Fake Word With Timestamp
    [Documentation]    Returns unique fake word combined with current epoch timestamp.
    ${timestamp}=    Get Time    epoch
    ${fake_word}=    Generate Fake Word
    ${unique_value}=    Set Variable    ${fake_word}-${timestamp}
    RETURN    ${unique_value}