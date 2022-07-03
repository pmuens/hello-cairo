import json

from starkware.crypto.signature.signature import pedersen_hash, sign

POLL_ID = 10018

input_data = json.load(open("voting_input_1.json"))

input_data["public_keys"][3] = "0x0"
input_data["public_keys"][5] = "0x0"
input_data["public_keys"][8] = "0x0"

# Generate a "yes" vote for voter 6.
vote = 1
voter_id = 6
priv_key = 123456 * voter_id + 654321

r, s = sign(msg_hash=pedersen_hash(POLL_ID, vote), priv_key=priv_key)

input_data["votes"] = [{"voter_id": voter_id, "vote": vote, "r": hex(r), "s": hex(s)}]

with open("voting_input_2.json", "w") as f:
    json.dump(input_data, f, indent=4)
    f.write("\n")
