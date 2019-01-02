#!/usr/bin/python

import xml.etree.ElementTree
import sys
reload(sys)
sys.setdefaultencoding('utf8')
LEXICAL_RESOURCE = "LexicalResource"
LEXICAL_ENTRY = "LexicalEntry"
SYNSET = "Synset"
LEMMA = "Lemma"
SYNSET_attrib = "synset"
ID = "id"
SENSE = "Sense"
SYNSET_RELATION="SynsetRelation"
TARGETS = "targets"
RELTYPE = "relType"
WRITTEN_FORM = "writtenForm"
PART_OF_SPEECH = "partOfSpeech"
BASE_CONCEPT = "baseConcept"
ITERATIVE = "*/"
SQL_FILE = "wordnet_basic.sql"
XML_FILE = sys.argv[1]
OUTPUT_FILE = sys.argv[2]
TWO_VALUES  = ''' ("{}","{}") '''
THREE_VALUES = ''' ("{}","{}","{}") '''
INSERT_LEXICAL_ENTRY_SQL = '''INSERT INTO LexicalEntry(id,writtenForm,partOfSpeech) VALUES'''
INSERT_SYNSET_SQL = '''INSERT INTO Synset(id,baseConcept) VALUES'''
INSERT_SENSE_SQL = '''INSERT INTO Sense(id,LexicalEntryId,SynsetId) VALUES'''
INSERT_SYNSET_RELATION_SQL = '''INSERT INTO SynsetRelation(sourceSynset,targetSynset,type) VALUES'''
DISABLE_FOREIGN_KEYS = '''SET FOREIGN_KEY_CHECKS=0;'''
ENABLE_FOREIGN_KEYS = '''SET FOREIGN_KEY_CHECKS=1;'''
RESULT_STRING = '''Found {} Lexical Entries, {} Synsets, with {} Senses, and {} Synset Relations'''
f=open(SQL_FILE, "r")
contents = f.read()
tree = xml.etree.ElementTree.parse(XML_FILE)
output = open(OUTPUT_FILE,"w")
root = tree.getroot()

if root.tag != LEXICAL_RESOURCE :
  system.exit(1)
print("Hello there")
output.write(contents)
LexicalEntries = tree.findall(ITERATIVE + LEXICAL_ENTRY)
Synsets = tree.findall(ITERATIVE + SYNSET)
lexicalLength = 0;
synsetLength = 0;
sensesLength = 0;
synsetRelationLength = 0;

lexicalLength = len(LexicalEntries)
synsetLength = len(Synsets)

output.write(DISABLE_FOREIGN_KEYS)
output.write("\r\n")

first = True
output.write(INSERT_LEXICAL_ENTRY_SQL)
output.write("\r\n")
for LexicalEntry  in LexicalEntries:
  wordEntry = LexicalEntry.attrib
  lemma = LexicalEntry.find(LEMMA).attrib
  if not first :
    output.write(",")
  else :
    first = False  
  output.write(THREE_VALUES.format(wordEntry[ID],lemma[WRITTEN_FORM],lemma[PART_OF_SPEECH]))
  output.write("\r\n")
output.write(";")
output.write("\r\n")

first = True
output.write(INSERT_SYNSET_SQL)
output.write("\r\n")
for Synset  in Synsets:
  synsetEntry = Synset.attrib
  if not first :
    output.write(",")
  else :
    first = False  
  output.write(TWO_VALUES.format(synsetEntry[ID],synsetEntry[BASE_CONCEPT]))
  output.write("\r\n")
output.write(";")
output.write("\r\n")

first = True
output.write(INSERT_SENSE_SQL)
output.write("\r\n")
for LexicalEntry  in LexicalEntries:
  wordEntry = LexicalEntry.attrib
  Senses = LexicalEntry.findall(SENSE)
  sensesLength+=len(Senses)
  for Sense in Senses :
    sense = Sense.attrib	
    if not first :
      output.write(",")
    else :
      first = False  
    output.write(THREE_VALUES.format(sense[ID],wordEntry[ID],sense[SYNSET_attrib]))
    output.write("\r\n")
output.write(";")
output.write("\r\n")

first = True
output.write(INSERT_SYNSET_RELATION_SQL)
output.write("\r\n")
for Synset  in Synsets:
  synsetEntry = Synset.attrib
  synsetRelations = Synset.findall(ITERATIVE + SYNSET_RELATION)
  synsetRelationLength+=len(synsetRelations)
  for synsetRelation in synsetRelations:
    relation = synsetRelation.attrib
    if not first :
      output.write(",")
    else :
      first = False  
    output.write(THREE_VALUES.format(synsetEntry[ID],relation[TARGETS],relation[RELTYPE]))
    output.write("\r\n")
output.write(";")
output.write("\r\n")

output.write(ENABLE_FOREIGN_KEYS)
output.write("\r\n")

output.close()
f.close()
print(RESULT_STRING.format(lexicalLength,synsetLength,sensesLength,synsetRelationLength))
