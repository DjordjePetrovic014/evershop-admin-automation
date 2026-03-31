*** Settings ***
Library     FakerLibrary
Library     String


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
    ${unique_value}=    Set Variable    ${fake_word}${timestamp}
    RETURN    ${unique_value}

Generate Fake Email
    [Documentation]    Returns fake email address from FakerLibrary.
    ${fake_email}=    Email
    RETURN    ${fake_email}

Generate Invalid Email
    [Documentation]    Returns random email that should not match any valid user.
    ${email}=    Generate Fake Email
    RETURN    ${email}

Generate Invalid Email Format
    [Documentation]    Returns invalid email format.
    ${word}=    Generate Fake Word
    RETURN    ${word}

Generate Invalid Password
    [Documentation]    Returns random invalid password with sufficient length.
    ${word}=    Generate Fake Word
    ${password}=    Set Variable    ${word}12345
    RETURN    ${password}

Generate Short Password
    [Documentation]    Returns random short password with 4 characters.
    ${word}=    Generate Fake Word
    ${short}=    Get Substring    ${word}    0    4
    RETURN    ${short}
